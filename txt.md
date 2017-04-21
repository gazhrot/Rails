=> inscription/connection

=> employer ou entreprise ?

=> si entreprise peut gerer ses employer, liste des clients de chaque employer,
  voir map interactive avec la geoloc de ses employers etc.

=> si employer, peut cree un nouveau client,

  - voir ses historiques de ses visites,
  - voir ce que le client a commander
  - definir un rappel (notification / sms / email) avec tout les (2week) sans avoir visiter un client
  exemple "email : vous n'avez pas rendu visite a Restaurant exemple depuis 14 jours / 2 week"
  - programmer une visite avec un client
  - historique des commandes pour chaque client
  - sur l'app, preremplissement du formulaire de commande avec ce que le client a pris a
    la derniere commande


    enterprise
      id
      code_enterprise
      name

    enterprise_user
      id
      user_id
      enterprise_id
      role

    user
      id
      code_enterprise
      first_name
      last_name
      email
      password
      role
      token
      timestamps

rails g model User code_enterprise:string first_name:string last_name:string email:string password:string role:int token:string timestamps
rails g model Enterprise code_enterprise:string name:string
rails g model Client name:string name:string lat:float lng:float last_order_date:date last_visit_date:date
rails g model enterprise_user user:references enterprise:references role:int
rails g model User_client user:references client:references
rails g model Visit_history user:references client:references visit_date:date
rails g model Order_history user:references client:references order_date:date
    user_client
      id
      user_id
      client_id

    client
      id
      name
      lat
      lng
      last_order_date
      last_visit_date
      timestamps

    visit_history
      id
      user_id
      client_id
      visit_date

    order_history
      id
      user_id
      client_id
      order_date
