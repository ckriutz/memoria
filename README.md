# Memoria

A Proof of Concept website written in PERL(!) with the help of [Mojolicious](http://mojolicious.org/).

Memoria is Spanish for "Memory".

The website contains a single button that when you click, it will increment a counter. It also shows the machine name it's running on.

### Get this running.

This application was developed on Linux, and is designed to run on linux, or in a container (see "To Build the container" below). If you're trying to get this running in Windows, you may encounter challenges.

Install Mojolicious:
```
curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious
```

Install the dependencies. Mostly just to get bootstrap/jquery.
```
npm install
```
... followed by:
```
bower install
```

After it is installed, execute:

```
morbo app.pl
```

### Using morbo, eh?
According to Mojolicious [Morbo](http://mojolicious.org/perldoc/Mojolicious/Guides/Cookbook#Morbo) is to "only be used during development". Well, if this was a bigger project, than we'd do something different, but for this and the container, Morbo should work fine.

### npm and bower? Are you serious?

Well, yes. I suppose I could just check in the files and be done with that, but there is no need to check in those files, and npm works as good as anything I suppose. Now, I realise the irony of installing nodejs just to install bower so I can install bootstrap, but well, that's how it goes. If there is a better way to set that up, let me know.

### To build the container

Make sure you are at the root of the project, then execute:
```
docker build -t memoria .
```

Once it is built. Run the container:

```
docker run -p 3000:3000 memoria
```

