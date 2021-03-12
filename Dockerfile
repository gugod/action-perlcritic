FROM perl:5.32
RUN cpanm -q --notest --no-man-pages Task::PerlCriticAllPolicies && rm -fr ./cpanm /root/.cpanm
RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
