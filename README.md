# BitPredict Oracle Protocol

> Decentralized Price Prediction Markets on Stacks Layer 2

A sophisticated prediction market protocol that enables users to stake STX tokens on asset price movements with oracle-verified outcomes. Built on Stacks Layer 2 for Bitcoin-level security with smart contract flexibility.

## 🎯 Overview

BitPredict is a decentralized prediction platform that combines the security of Bitcoin with the flexibility of smart contracts through Stacks Layer 2. Users can participate in prediction markets by staking STX tokens on asset price movements, with outcomes verified by trusted oracles and automatic reward distribution.

### Key Features

- **Bitcoin-Secured Infrastructure**: Leverages Stacks Layer 2 for enhanced security
- **Oracle-Verified Outcomes**: Trusted price data for accurate market resolution
- **Comprehensive Market Lifecycle**: From creation to resolution with automated payouts
- **Advanced Analytics**: Real-time market metrics and user performance tracking
- **Decentralized Governance**: Community-driven protocol evolution
- **Risk Management**: Built-in safety mechanisms and fee caps

## 🏗️ System Architecture

### Core Components

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Market Layer  │    │  Oracle Layer   │    │  Analytics      │
│                 │    │                 │    │  Layer          │
│ • Market CRUD   │    │ • Price Feeds   │    │ • Performance   │
│ • Predictions   │◄──►│ • Resolution    │◄──►│ • Metrics       │
│ • Stake Mgmt    │    │ • Validation    │    │ • Statistics    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
         ┌─────────────────────────────────────────────────────┐
         │              Protocol Core Layer                     │
         │                                                     │
         │ • State Management    • Financial Operations        │
         │ • Access Control      • Event Logging              │
         │ • Error Handling      • Configuration Management   │
         └─────────────────────────────────────────────────────┘
                                 │
         ┌─────────────────────────────────────────────────────┐
         │                Stacks Layer 2                       │
         │           (Bitcoin-Anchored Security)               │
         └─────────────────────────────────────────────────────┘
```

## 📊 Contract Architecture

### Data Structures

#### Markets Map

```clarity
markets: {
  market-id: {
    creator: principal,
    asset-name: string,
    start-price: uint,
    end-price: uint,
    total-up-stake: uint,
    total-down-stake: uint,
    start-block: uint,
    end-block: uint,
    resolution-block: uint,
    resolved: bool,
    total-participants: uint,
    creation-block: uint
  }
}
```

#### User Predictions Map

```clarity
user-predictions: {
  {market-id, user}: {
    prediction: "up" | "down",
    stake: uint,
    claimed: bool,
    timestamp: uint,
    block-height: uint
  }
}
```

#### Analytics Maps

- **user-stats**: Comprehensive user performance metrics
- **market-analytics**: Market-specific performance data

### Core Functions

#### Market Operations

- `create-market`: Initialize new prediction markets
- `make-prediction`: Submit predictions with stake
- `resolve-market`: Oracle-verified market resolution
- `claim-winnings`: Automated reward distribution

#### Query Interface

- `get-market-details`: Comprehensive market information
- `get-user-prediction-details`: User-specific prediction data
- `get-user-stats`: Performance analytics
- `get-platform-stats`: Protocol-wide metrics

#### Administrative Functions

- `set-oracle-address`: Oracle management
- `set-minimum-stake`: Stake requirements
- `set-platform-fee`: Fee configuration
- `toggle-protocol-pause`: Emergency controls

## 🔄 Data Flow

### Market Creation Flow

```
Owner → create-market() → Validation → Market Storage → Event Emission
                              ↓
                      Active Markets Counter++
```

### Prediction Flow

```
User → make-prediction() → Validation → STX Transfer → State Update
                               ↓             ↓
                        Stake Verification → Analytics Update
```

### Resolution Flow

```
Oracle → resolve-market() → Price Validation → Market Closure
                                ↓
                        Analytics Calculation → State Update
```

### Claim Flow

```
User → claim-winnings() → Eligibility Check → Payout Calculation
                              ↓                    ↓
                        Fee Deduction → STX Transfer → Stats Update
```

## 🚀 Getting Started

### Prerequisites

- Stacks wallet with STX tokens
- Access to Stacks testnet/mainnet
- Basic understanding of prediction markets

### Deployment

1. Deploy contract to Stacks network
2. Set oracle address via `set-oracle-address`
3. Configure minimum stake and fees
4. Create initial markets

### Usage Examples

#### Creating a Market (Owner Only)

```clarity
(contract-call? .bitpredict create-market 
  "BTC-USD" 
  u50000 
  u1000 
  u1144)
```

#### Making a Prediction

```clarity
(contract-call? .bitpredict make-prediction 
  u1 
  "up" 
  u1000000)
```

#### Claiming Winnings

```clarity
(contract-call? .bitpredict claim-winnings u1)
```

## 📈 Economic Model

### Fee Structure

- **Platform Fee**: 2% (configurable, max 10%)
- **Minimum Stake**: 1 STX (configurable)
- **Revenue Model**: Platform fees collected on winnings

### Payout Calculation

```
Gross Winnings = (User Stake × Total Pool) ÷ Winning Pool
Platform Fee = Gross Winnings × Fee Percentage
Net Payout = Gross Winnings - Platform Fee
```

### Risk Management

- Maximum 50% contract balance withdrawal limit
- Configurable fee caps (10% maximum)
- Emergency pause functionality
- Minimum market duration requirements

## 🔐 Security Features

### Access Control

- **Owner-only functions**: Market creation, configuration
- **Oracle-only functions**: Market resolution
- **User functions**: Predictions, claims

### Validation Layers

- Input parameter validation
- Financial transaction verification
- Market state consistency checks
- Temporal constraint enforcement

### Error Handling

Comprehensive error codes covering:

- Authorization (100-103)
- Market lifecycle (200-206)
- Financial operations (300-304)
- Input validation (400-404)

## 📊 Analytics & Monitoring

### User Metrics

- Total predictions made
- Win/loss ratios
- Profit/loss tracking
- Activity timestamps

### Market Analytics

- Participation rates
- Volatility scores
- Final odds
- Resolution times

### Platform Statistics

- Total volume processed
- Active markets count
- Fee collection
- Contract utilization

## 🛠️ Configuration

### Protocol Parameters

```clarity
MINIMUM_MARKET_DURATION: 144 blocks (~24 hours)
MAX_FEE_PERCENTAGE: 10%
MAXIMUM_ASSET_NAME_LENGTH: 32 characters
BLOCKS_PER_DAY: 144
```

### Administrative Controls

- Oracle address management
- Fee structure updates
- Minimum stake configuration
- Emergency pause/unpause

## 🔮 Future Enhancements

- Multi-asset prediction markets
- Liquidity mining rewards
- Governance token integration
- Advanced market types (binary, scalar)
- Cross-chain oracle integration

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines and submit pull requests for any improvements.
