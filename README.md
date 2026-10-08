# Damn Vulnerable C# API

[DVCSharp API](https://github.com/appsecco/dvcsharp-api) by Appsecco: a deliberately vulnerable
REST API written in C# with ASP.NET Core and Entity Framework Core. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machine, and the
upstream source in [`build/web/app/`](build/web/app) builds with its own Dockerfile (on the
.NET Core 2.1 SDK, since its `microsoft/dotnet` base is gone).

| Machine | Service |
| --- | --- |
| api | DVCSharp API on port 5000, under `/api/`, with its SQLite database |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then call http://localhost:5000/api/products, register with `POST /api/registrations` and get
a token from `POST /api/authorizations`. The same spec runs as Docker on a local VM
(`docker-vm`), on a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: upstream's book in
[`build/web/app/documentation-dvcsharp-book/`](build/web/app/documentation-dvcsharp-book) and
its Postman collection
([`DVCSharp-API.postman_collection.json`](build/web/app/DVCSharp-API.postman_collection.json)).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

MIT, as DVCSharp API ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it
isolated.
