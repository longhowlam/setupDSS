# setupDSS
setup R environment and dataiku DSS  from a droplet

#cloud-config
runcmd:
  - [ git , clone , 'https://github.com/longhowlam/setupDSS.git']
  - echo "git cloned"
  - [chmod, +x , /setupDSS/startit.sh]
  - echo "changed mod"
  - /setupDSS/startit.sh
  - echo "Finished"
