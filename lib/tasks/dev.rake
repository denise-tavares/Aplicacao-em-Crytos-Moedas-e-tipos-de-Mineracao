namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner ("Apagando BD...") { %x(rails db:drop) }
      show_spinner ("Criando BD...") { %x(rails db:create) }
      show_spinner ("Migrando BD...") { %x(rails db:migrate)}
      %x(rails dev:add_mining_types) 
      %x(rails dev:add_coins) 
  
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadrastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadrastando Moedas...") do
      spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
      spinner.auto_spin

      coins = [
        {
          description:"biticon",
          acronym: "BTC",
          url_image:"https://media.gettyimages.com/id/882085928/pt/vetorial/blockchain-bitcoin-icon-symbol-vector.jpg?s=612x612&w=gi&k=20&c=Ofe8911nisVJXfq-qViIfmW9R8knG-RhVUQYPDBqcSE=",
          nining_type: NiningType.find_by(acronym:'PoW')
        },
        {
          description:"Ethereum",
          acronym: "ETH",
          url_image: "https://d33wubrfki0l68.cloudfront.net/fcd4ecd90386aeb50a235ddc4f0063cfbb8a7b66/4295e/static/bfc04ac72981166c740b189463e1f74c/40129/eth-diamond-black-white.jpg",
          nining_type: NiningType.all.sample
        },
        {
          description:"Dash",
          acronym: "DASH",
          url_image: "https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-Transparent.png",
          nining_type: NiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end    
  end

  desc "Cadastro dos tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando moedas...") do
      mining_types = [
        { description: "Proof of Work", acronym: "PoW" },
        { description: "Proof of Stake", acronym: "PoS" },
        { description: "Proof of Capacity", acronym: "PoC" }
      ]
  
      mining_types.each do |mining_type|
        NiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start,msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
