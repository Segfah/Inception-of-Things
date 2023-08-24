#!/bin/bash

if [ -x "$(command -v k3d)" ]; then
	echo "k3d est déjà installé."
else
	echo "Installation de k3d..."
	# Télécharger le script d'installation de k3d et l'exécuter
	wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
	echo "k3d a été installé avec succès."
fi

