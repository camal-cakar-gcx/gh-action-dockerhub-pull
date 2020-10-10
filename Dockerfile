FROM golang:1.15-alpine as build

WORKDIR /src/
COPY . .
RUN CGO_ENABLED=0 go build -o /bin/app main.go


FROM scratch
COPY --from=build /bin/app /bin/app
ENTRYPOINT ["/bin/app"]
