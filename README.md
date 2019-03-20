# ruby_burp
It Parses Burp Scanner XML file

## Table of contents

-  [Install](#install)
-  [Set Up](#set-up)
	- [JWT](#jwt)
	- [Database](#database)
	- [Email](#email)
	- [Application](#application)
-  [Running](#set-up)
-  [Architecture](#architecture)
-  [Logging](#logging)
-  [Programming](#programming)
	- [Adding New CRUD](#adding-new-crud)
	- [Authentication](#authentication)
	- [Authorization](#authorization)
-  [Migration](#migration)
-  [Internacionalization](#internacionalization)
-  [Sending Emails](#sending-emails)
-  [License](#license)

## Install

### Go

[Install Golang](https://golang.org/doc/install)

### Dependences

```
$> go get github.com/jinzhu/gorm
$> go get gopkg.in/yaml.v2
$> go get github.com/gorilla/mux
$> go get github.com/dgrijalva/jwt-go
$> go get github.com/satori/go.uuid
$> go get github.com/lib/pq
$> go get golang.org/x/crypto/bcrypt
```


## Set up


### JWT

The following keys are used by JWT.

```
$> cd config/keys
$> openssl genrsa -out app.key.rsa 1024
$> openssl rsa -in app.key.rsa -pubout > app.key.rsa.pub
```

### Database

Connect to your database

```
$> cd config
$> cp database.example.yml database.yml
```

Edit _database.yml_ and set up your database credentials

### Email

Connect to your email provider

```
$> cd config
$> cp email.example.yml email.yml
```

Edit _email.yml_ and set up your email credentials

### Application

Set up _app.yml_ file for app work pristine

```
$> cd config
$> cp app.example.yml app.yml
```

Edit app.yml and set the following options:

1. _app_name_: Give a name to your app
2. _frontend_base_url_: URL to be used on emails and access the right URL of your frontend
3. _secret_key_: Key to encrypt passwords on database
4. _reset_password_expiration_seconds_: After reset password is requested, how long (in seconds) is it valid?
5. _token_expiration_seconds_: After a JWT token is generated, how long (in seconds) is it valid?
6. _locales_: List of locales available

### Locales

Words and phrases for internacionalization. You can add your own locales files, but remenber to set up the _app.yml_ configuration file.

```
$> cd config/locales
$> cp en.yml YOUR_LOCALE.yml
```

And edit _YOUR_LOCALE.yml_


## Running


```
$> go run main.go
```

### Migration

```
$> go run main.go -mode=migrate
```

### Options

### Help

Prints help menu

```
$> go run main.go --help
```

You can set up the Port and Host binding


### Architecture

MVC

## Logging

utils.LoggerInfo().Println("Logger example")


## Programming


### Adding New CRUD

### Authentication

### Authorization

## Migration


## Internacionalization


## Sending Emails


## License

