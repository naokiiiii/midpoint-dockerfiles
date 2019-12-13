upstream iga.example.com {
    server iga1:8080 max_fails=1;
    server iga2:8080 max_fails=1;
    server mp-ha-example_iga_1:8080 max_fails=1;
    server mp-ha-example_iga_2:8080 max_fails=1;
    sticky name=iga_lb_id hash=index domain=.example.com path=/;
    keepalive 100;
}

server {
    listen       80;
    server_name  iga.example.com;

    location / {
        proxy_pass http://iga.example.com/;
        proxy_redirect http://iga.example.com/ https://iga.example.com/;
        proxy_set_header X-Forwarded-For $remote_addr;

        # for keepalive
        proxy_http_version 1.1;
        proxy_set_header Connection "";
    }
}

server {
    listen   443 ssl;
    server_name  iga.example.com;

    ssl_certificate      example.crt;
    ssl_certificate_key  example.key;

    ssl_session_cache    shared:SSL:1m;
    ssl_session_timeout  5m;

    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers  on;

    port_in_redirect off;

    location / {
        proxy_pass http://iga.example.com/;
        proxy_redirect http://iga.example.com/ https://iga.example.com/;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto https;

        proxy_http_version 1.1;
        proxy_set_header Connection "";
    }
}
