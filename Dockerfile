FROM debian:buster

RUN set -x;\
    apt update && apt install wget ca-certificates -y

RUN set -x;\
    dpkg --add-architecture i386 && apt update && apt install -fy

RUN set -x;\
    mkdir /deepintemp && cd /deepintemp && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine/deepin-wine_2.18-22~rc0_all.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32_2.18-22~rc0_i386.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32-preloader_2.18-22~rc0_i386.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine-helper/deepin-wine-helper_1.2deepin8_i386.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine-plugin/deepin-wine-plugin_1.0deepin2_amd64.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine-plugin-virtual/deepin-wine-plugin-virtual_1.0deepin3_all.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine-uninstaller/deepin-wine-uninstaller_0.1deepin2_i386.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/u/udis86/udis86_1.72-2_i386.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine/deepin-fonts-wine_2.18-22~rc0_all.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin-wine/deepin-libwine_2.18-22~rc0_i386.deb && \
    wget https://mirrors.aliyun.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_amd64.deb && \
    wget https://mirrors.aliyun.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_i386.deb && \
    wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.8.65deepin0_i386.deb

RUN apt install /deepintemp/deepin-fonts-wine_2.18-22~rc0_all.deb && \
    apt install /deepintemp/libjpeg62-turbo_1.5.1-2_i386.deb -y && \
    apt install /deepintemp/libjpeg62-turbo_1.5.1-2_amd64.deb && \
    apt install /deepintemp/udis86_1.72-2_i386.deb && \
    apt install /deepintemp/deepin-libwine_2.18-22~rc0_i386.deb -y && \
    apt install /deepintemp/deepin-wine32_2.18-22~rc0_i386.deb -y && \
    apt install /deepintemp/deepin-wine32-preloader_2.18-22~rc0_i386.deb && \
    apt install /deepintemp/deepin-wine_2.18-22~rc0_all.deb && \
    apt install /deepintemp/deepin-wine-plugin_1.0deepin2_amd64.deb -y && \
    apt install /deepintemp/deepin-wine-plugin-virtual_1.0deepin3_all.deb -y && \
    apt install /deepintemp/deepin-wine-helper_1.2deepin8_i386.deb -y && \
    apt install /deepintemp/deepin-wine-uninstaller_0.1deepin2_i386.deb

RUN set -x;\
    dpkg -i /deepintemp/deepin.com.wechat_2.6.8.65deepin0_i386.deb

RUN set -x;\
    apt-get install -y procps dbus-x11 ibus

RUN set -x;\
    rm -rf /deepintemp/

RUN echo "bash /opt/deepinwine/apps/Deepin-WeChat/run.sh" > start_wechat.sh
RUN chmod +x start_wechat.sh

CMD ["./start_wechat.sh"]
