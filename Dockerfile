FROM debian

# Install curl
RUN apt-get update \
&&  apt-get install -y curl \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

# Create a jupyter directory
RUN mkdir /root/jupyter
WORKDIR /root/jupyter

# Install pixi & the software specified in pixi.toml/lock
RUN curl -fsSL https://pixi.sh/install.sh | bash
ADD pixi.toml pixi.lock /root/jupyter/
RUN /root/.pixi/bin/pixi install

# Configure Jupyter (very permissively)
RUN /root/.pixi/bin/pixi run jupyter lab --generate-config
ADD jupyter_lab_config.py /root/jupyter/
RUN mv jupyter_lab_config.py /root/.jupyter/jupyter_lab_config.py

EXPOSE 8888

CMD ["/root/.pixi/bin/pixi", "run", "jupyter", "lab"]



