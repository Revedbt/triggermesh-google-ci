FROM gcr.io/triggermesh/tm:v0.0.7 as TM

RUN which tm

FROM quay.io/realeyes/google-cloud-auto-snapshot:latest

COPY --from=TM /usr/bin/tm /usr/local/bin/tm

RUN chmod +x /usr/local/bin/tm

CMD ['/usr/local/bin/tm', '--version']
