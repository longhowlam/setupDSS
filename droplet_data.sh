#cloud-config
users:
  - name: ruser
    groups: sudo
    shell: /bin/bash
    
chpasswd:
  list: |
    ruser:ruser123
  expire: False

runcmd:
  - [ git , clone , 'https://github.com/longhowlam/setupDSS.git']
  - echo "git cloned"
  - [chmod, +x , /setupDSS/startit.sh]
  - echo "changed mod"
  - /setupDSS/startit.sh
  - echo "Finished"
