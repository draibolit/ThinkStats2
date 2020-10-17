#!/bin/bash
if [ -z "$1" ] 
then
		des="pythonenv"
else
		des="$1"
		echo "#!/bin/bash \n source ./"$des"/bin/activate" ./.env
		sed -i "s/pythonenv/$des/g" ./.env
fi

#optional: sudo apt-get install python3-pip

pip3 install --user virtualenv
python3 -m virtualenv "$des"
source ./"$des"/bin/activate
if [ $? -eq 0 ]; then
		pip install -r requirements.txt
else 
		echo "virtualenv is not installed properly"
fi

#https://virtualenv.pypa.io/en/latest/installation/
#https://medium.com/python-pandemonium/better-python-dependency-and-package-management-b5d8ea29dff1

