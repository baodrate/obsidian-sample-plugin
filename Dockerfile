FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ADD . /template

WORKDIR /template

ARG DEBIAN_FRONTEND=noninteractive
# Prepare apt for buildkit cache
RUN rm -f /etc/apt/apt.conf.d/docker-clean && \
	echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' >/etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt update -y && \
	apt install -y \
	git

RUN --mount=type=cache,target=/root/.cache/uv \
	uv sync --frozen

WORKDIR /app

ENTRYPOINT ["uv", "run", "--directory", "/template", "copier", "copy", "--trust", "/template", "/app"]
