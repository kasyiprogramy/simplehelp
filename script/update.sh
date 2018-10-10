# Generate a timestamp
        now=$(date +"%Y%m%d_%H%M%S")

		# Stop the server
        cd /opt
        if [ -d "/opt/SimpleHelp" ]; then
                cd SimpleHelp
                sh serverstop.sh             
        fi

        # Fetch the new version
        echo "Downloading the latest version"
        if [ `uname -m | grep "64"` ]; then
                rm -f SimpleHelp-linux-amd64.tar.gz
                wget https://simple-help.com/releases/SimpleHelp-linux-amd64.tar.gz
                tar -xzf SimpleHelp-linux-amd64.tar.gz
        else
                rm -f SimpleHelp-linux-tar.gz
                wget https://simple-help.com/releases/SimpleHelp-linux.tar.gz
                tar -xzf SimpleHelp-linux.tar.gz
        fi

        # Start the new server
        echo "Starting your new SimpleHelp server"
        cd SimpleHelp
        sh serverstart.sh
        cd ..
