# scgp-cicd-integation
[![Mulesoft Package](https://github.com/dvgamerr/scgp-cicd-integation/actions/workflows/build.yml/badge.svg)](https://github.com/dvgamerr/scgp-cicd-integation/actions/workflows/build.yml)

### Config build and deploy

- `pom.xml` Add config.

```xml
<distributionManagement>
  <repository>
    <id>anypoint-exchange-v3</id>
    <name>Corporate Repository</name>
    <url>https://maven.anypoint.mulesoft.com/api/v3/organizations/${env.ORGANIZATION_ID}/maven</url>
    <layout>default</layout>
  </repository>
</distributionManagement>


<build>
  <plugins>
    <plugin>

      ...

      <configuration>
        <cloudHubDeployment>
	  <muleVersion>${app.runtime}</muleVersion>
	  <connectedAppClientId>${mulesoft.client.id}</connectedAppClientId>
	  <connectedAppClientSecret>${mulesoft.client.secret}</connectedAppClientSecret>
	  <connectedAppGrantType>client_credentials</connectedAppGrantType>
	  <applicationName>${env.APP_ID}</applicationName>
	  <environment>${env.ENVIRONMENT}</environment>
          <workers>1</workers>
          <workerType>MICRO</workerType>
          <objectStoreV2>true</objectStoreV2>
          <region>us-east-2</region>
          <businessGroupId>${env.ORGANIZATION_ID}</businessGroupId>
        </cloudHubDeployment>
      </configuration>
    </plugin>
	</build>
  ...

</plugins>
```

- create `settings.xml`in repos, like [settings.xml](./settings.xml).
- [Create a Connectioned App](https://docs.mulesoft.com/access-management/connected-apps-developers) Any organization administrator can control it.
- create Secret Actions `CLIENT_ID`, `CLIENT_SECRET`, `ORGANIZATION_ID`
- copy github actions [build.xml](./.github/workflows/build.yml) and edit for your project

### Referance
- https://docs.mulesoft.com/exchange/connected-app-authentication
- https://mulesoft-labs.dev/codelabs/cicd-with-github-actions/index.html#3
- https://help.mulesoft.com/s/question/0D52T00005JWeXhSAL/connected-apps-and-tokens
- https://www.linkedin.com/pulse/mulesoft-cicd-github-actions-pralay-debroy
