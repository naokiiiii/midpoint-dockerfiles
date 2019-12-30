# Dockerイメージの指定
FROM evolveum/midpoint:4.0.1

# midPointホームに初期設定ファイルの配置
COPY ./_midpoint_home/ /opt/midpoint/var/

# 起動オプション設定処理の修正
COPY ./start-midpoint_wrapper.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start-midpoint_wrapper.sh

# 起動シェルスクリプトをラッパーシェルスクリプトで拡張
CMD ["/usr/local/bin/start-midpoint_wrapper.sh"]
