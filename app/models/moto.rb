class Moto < ApplicationRecord
    # Associações
    has_many :alugueis
    has_many :manutencoes
    
    # Validações
    validates :marca, :modelo, :ano, :placa, :valor_diaria, presence: true
    validates :placa, uniqueness: true
    validates :quilometragem, numericality: { greater_than_or_equal_to: 0 }
    validates :valor_diaria, numericality: { greater_than: 0 }
    validates :status, inclusion: { in: ['disponivel', 'alugada', 'manutencao'] }
    
    # Escopo para filtros comuns
    scope :disponiveis, -> { where(status: 'disponivel') }
    scope :em_manutencao, -> { where(status: 'manutencao') }
    scope :alugadas, -> { where(status: 'alugada') }
    
    # Métodos auxiliares
    def disponivel?
      status == 'disponivel'
    end
    
    def precisa_manutencao?
      return false unless proxima_manutencao
      proxima_manutencao <= Date.today
    end
    
    def info_completa
      "#{marca} #{modelo} (#{ano}) - #{placa}"
    end
  end