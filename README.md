# Set up doc for Project D ansible demo

## 1. Server Nodes
* #### nexus repo
  * a Nexus repo already installed at `192.168.223.130` => change to your own ip
  * `/opt2/nexus/nexus-3.2.0-01/bin/nexus start`
  * `/opt2/nexus/nexus-3.2.0-01/bin/nexus stop`
  * setup a new raw repo call `demo`
  * http://192.168.223.123:8081
  * Commands to update artifacts:
        curl --fail -u admin:admin123 --upload-file ./modules.zip  'http://192.168.223.130:8081/repository/demo/store/1.0.0/modules.zip'

        curl --fail -u admin:admin123 --upload-file ./standalone.xml  'http://192.168.223.130:8081/repository/demo/store/1.0.0/standalone.xml'

        curl --fail -u admin:admin123 --upload-file ./store.war  'http://192.168.223.130:8081/repository/demo/store/1.0.0/store.war'

        curl --fail -u admin:admin123 --upload-file ./startup.properties  'http://192.168.223.130:8081/repository/demo/store/1.0.0/startup.properties'

  * turn off firewall

* #### webserver node
  * 192.168.223.123 => change to your own ip
  * sudo unzip jboss-eap-7.0.0.zip -d /opt/
  * sudo chown -hR virtuser:virtuser /opt/jboss-eap-7.0/
  * /opt/jboss-eap-7.0/bin/jboss-cli.sh "patch apply /home/virtuser/jboss-eap-7.0.4-patch.zip"
  * Install Java

    `sudo yum install java`

    * check yum.repo.d , if have installation issues, some repo may have been turned off
  * Install utilities

    `sudo install zip unzip `
  * turn off firewall    

* #### database node
  * 192.168.223.124 => change to your own ip
  * install mysql / maria db related packages

    `sudo yum install mysql-python`

     `sudo yum install mariadb-server mariadb-client`

     `sudo mysql_secure_installation`         

    * check yum.repo.d , if have installation issues, some repo may have been turned off
  * Install utilities

      `sudo install zip unzip `
  * `sudo systemctl start mariadb`
  * turn off firewall

## 2. Software Artifacts

* #### git repo

  * `https://github.com/wohshon/ansible-jboss-standalone`
  * `/deploy-app-playbook` - playbook
  * `repo_artifacts` - stuffs to be hosted on repo


## 3. Running the playbook

* #### running the playbook

  * check through the config variables in `group_vars` and `vars`
  * update hosts file with your own ip address
  * `ansible-playbook ^C hosts site.yml`
`

