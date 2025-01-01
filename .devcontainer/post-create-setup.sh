#!/bin/bash

# Set up batcat if not already linked
if [ ! -f ~/.local/bin/bat ]; then
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# Setup and update Stripe CLI
if ! grep -q "stripe.list" /etc/apt/sources.list.d/* 2>/dev/null; then
  curl -s https://packages.stripe.dev/api/security/keypair/stripe-cli-gpg/public | gpg --dearmor | sudo tee /usr/share/keyrings/stripe.gpg
  echo "deb [signed-by=/usr/share/keyrings/stripe.gpg] https://packages.stripe.dev/stripe-cli-debian-local stable main" | sudo tee -a /etc/apt/sources.list.d/stripe.list
fi

sudo apt update
sudo apt install -y stripe

# Install global packages
npm install pnpm@9.15.1 turbo eas-cli --global

# Print confirmation message
echo "Post-create setup completed successfully!"