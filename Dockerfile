FROM node:alpine as builder

WORKDIR /build
COPY package.json package.json
RUN yarn
COPY . .
RUN yarn build
RUN ls
RUN ls dist


FROM alpine
WORKDIR /server
COPY --from=builder /build/dist/node-pkg-docker-alpine app
CMD ./app