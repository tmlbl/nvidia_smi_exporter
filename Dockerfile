FROM golang:1.13

COPY nvidia_smi_exporter.go nvidia_smi_exporter.go

RUN go build -o /bin/nvidia_smi_exporter nvidia_smi_exporter.go

FROM nvidia/cuda:10.1-base

COPY --from=0 /bin/nvidia_smi_exporter /bin/

EXPOSE 9101

CMD [ "/bin/nvidia_smi_exporter" ]
