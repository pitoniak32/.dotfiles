function ensure_parent_dir {
  file_path=$1
  file_name=${file_path##*/}
  base_dir=${file_path%/*}
  if [[ ! -d $base_dir ]]; then
    echo "Creating [$base_dir]"
    mkdir -p $base_dir
  fi
}

function load_zsh_plugin {
  file_path=$1
  file_name=${file_path##*/}
  base_dir=${file_path%/*}
  if [[ ! -f $file_path ]]; then
    echo "Cloning $file_name..."
    git clone https://github.com/zsh-users/${file_name/.zsh/} $base_dir
  fi
  source $file_path
}

