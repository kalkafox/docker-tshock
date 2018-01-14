# docker-tshock
Dockerfile for TShock 4.3.25.

I do not claim ownership of TShock. Visit TShock's website [here.](https://tshock.co)

## Running the container

There are two ways of doing this. You can let the container autocreate the world when you start it, or you can create it on your own when you start it up. (This would mean re-creating the container twice. Adding a parameter will make this easier, which I will show later in this guide.)

Pull the image like so.

`docker pull kalka/docker-tshock`

### Plug n' Play method

`docker run -d --name tshock -p 7777:7777 -v /opt/tshock/tshock:/opt/tshock/tshock -v /opt/tshock/data:/opt/tshock/world kalka/tshock -autocreate 3`

`autocreate` has 3 possible values. 1 is small, 2 is medium, and 3 is large. Depending on your machine's resources, this may take a while. You can do `docker logs tshock` to check server status.

### Custom world method

`docker run -it --rm --name tshock -p 7777:7777 -v /opt/tshock/tshock:/opt/tshock/tshock -v /opt/tshock/data:/opt/tshock/world kalka/tshock`

Run through the steps. After you've created the world, you can successfully quit from the container. It will automatically remove itself.

`docker run -d --name tshock -p 7777:7777 -v /opt/tshock/tshock:/opt/tshock/tshock -v /opt/tshock/data:/opt/tshock/world kalka/tshock -world world/<WORLDNAME>.wld`

<WORLDNAME> of course, being the name you chose.

## Reference:

Use [this](https://tshock.readme.io/v4.3.25/docs/command-line-parameters) documentation if you want to add more parameters to your command line for the server.
