FROM perl:5.32
RUN curl -fsSL --compressed https://git.io/cpm > /usr/local/bin/cpm && chmod +x /usr/local/bin/cpm
RUN cpm install -g Task::PerlCriticAllPolicies \
    && rm -fr ./cpanm /root/.cpanm /root/.perl-cpm
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
