# scgp-cicd-integation


- [Create a Connectioned App](https://docs.mulesoft.com/access-management/connected-apps-developers) Any organization administrator can control it.

- `pom.xml` Add config.

```xml

<properties>
  <application.name>scgp-cicd-integation</application.name>
  <mulesoft.organization>${mule.organization.id}</mulesoft.organization>
</properties>

<distributionManagement>
  <repository>
    <id>anypoint-exchange-v3</id>
    <name>Corporate Repository</name>
    <url>https://maven.anypoint.mulesoft.com/api/v3/organizations/${mule.organization.id}/maven</url>
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
          <connectedAppClientId>${env.CLIENT_ID}</connectedAppClientId>
          <connectedAppClientSecret>${env.CLIENT_SECRET}</connectedAppClientSecret>
          <connectedAppGrantType>client_credentials</connectedAppGrantType>
          <applicationName>${application.name}</applicationName>
          <environment>Sandbox</environment>
          <workers>1</workers>
          <workerType>MICRO</workerType>
          <objectStoreV2>true</objectStoreV2>
          <region>us-east-2</region>
          <businessGroupId>${env.BUSSINATE_GROUP_ID}</businessGroupId>
        </cloudHubDeployment>
      </configuration>
    </plugin>
	</build>
  ...

</plugins>
```

- create `settings.xml` in repos.

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<settings>
  <servers>
    <server>
      <id>MuleRepository</id>
      <connectedAppClientId>${env.CLIENT_ID}</connectedAppClientId>
      <connectedAppClientSecret>${env.CLIENT_SECRET}</connectedAppClientSecret>
      <connectedAppGrantType>client_credentials</connectedAppGrantType>
    </server>
    <server>
      <id>anypoint-exchange-v3</id>
      <connectedAppClientId>${env.CLIENT_ID}</connectedAppClientId>
      <connectedAppClientSecret>${env.CLIENT_SECRET}</connectedAppClientSecret>
      <connectedAppGrantType>client_credentials</connectedAppGrantType>
    </server>
  </servers>
  <pluginGroups>
    <pluginGroup>org.mule.tools</pluginGroup>
  </pluginGroups>
  <profiles>
    <profile>
      <id>mule-extra-repos</id>
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>
      <repositories>
        <repository>
          <id>mule-public</id>
          <url>https://repository.mulesoft.org/nexus/content/repositories/public</url>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          <id>mule-public</id>
          <url>https://repository.mulesoft.org/nexus/content/repositories/public</url>
        </pluginRepository>
      </pluginRepositories>
    </profile>
    <profile>
      <id>Mule</id>
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>
      <repositories>
        <repository>
          <id>MuleRepository</id>
          <name>MuleRepository</name>
          <url>https://repository.mulesoft.org/nexus-ee/content/repositories/releases-ee/</url>
          <layout>default</layout>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>
</settings>
```

### Referance
- https://docs.mulesoft.com/exchange/connected-app-authentication
- hhttps://mulesoft-labs.dev/codelabs/cicd-with-github-actions/index.html#3
- https://help.mulesoft.com/s/question/0D52T00005JWeXhSAL/connected-apps-and-tokens
- https://www.linkedin.com/pulse/mulesoft-cicd-github-actions-pralay-debroy