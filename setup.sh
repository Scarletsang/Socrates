  rm -rf ~/Library/Containers/com.docker.docker
  rm -rf ~/.docker
  rm -rf /goinfre/${USER}/docker /goinfre/${USER}/agent
  mkdir -p /goinfre/${USER}/docker /goinfre/${USER}/agent/Data
  ln -s /goinfre/${USER}/agent ~/Library/Containers/com.docker.docker
  ln -s /goinfre/${USER}/docker ~/.docker &&
  echo $BLUE"docker is set up in goinfre now"$WHITE