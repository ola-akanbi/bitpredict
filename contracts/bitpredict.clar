;; BitPredict Oracle Protocol
;; Title: BitPredict - Decentralized Price Prediction Markets
;; Summary: Bitcoin-secured oracle-driven prediction platform leveraging Stacks L2
;; Description: A sophisticated prediction market protocol that enables users to
;;              stake STX tokens on asset price movements with oracle-verified
;;              outcomes. Built on Stacks Layer 2 for Bitcoin-level security
;;              with smart contract flexibility. Features comprehensive market
;;              lifecycle management, advanced analytics, and decentralized
;;              governance mechanisms.

;; PROTOCOL CONSTANTS & ERROR HANDLING

;; Protocol Identity & Governance
(define-constant CONTRACT_OWNER tx-sender)
(define-constant PROTOCOL_NAME "BitPredict")
(define-constant PROTOCOL_VERSION "1.0.0")

;; Authorization & Access Control Errors
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_OWNER_ONLY (err u101))
(define-constant ERR_ORACLE_ONLY (err u102))
(define-constant ERR_PROTOCOL_PAUSED (err u103))

;; Market Lifecycle Errors
(define-constant ERR_MARKET_NOT_FOUND (err u200))
(define-constant ERR_INVALID_PREDICTION (err u201))
(define-constant ERR_MARKET_CLOSED (err u202))
(define-constant ERR_MARKET_NOT_RESOLVED (err u203))
(define-constant ERR_ALREADY_CLAIMED (err u204))
(define-constant ERR_ALREADY_RESOLVED (err u205))
(define-constant ERR_MARKET_ACTIVE (err u206))

;; Financial Transaction Errors
(define-constant ERR_INSUFFICIENT_BALANCE (err u300))
(define-constant ERR_INSUFFICIENT_STAKE (err u301))
(define-constant ERR_TRANSFER_FAILED (err u302))
(define-constant ERR_INVALID_AMOUNT (err u303))
(define-constant ERR_WITHDRAWAL_LIMIT (err u304))

;; Input Validation Errors
(define-constant ERR_INVALID_PARAMETER (err u400))
(define-constant ERR_INVALID_TIMEFRAME (err u401))
(define-constant ERR_INVALID_PRICE (err u402))
(define-constant ERR_INVALID_ADDRESS (err u403))
(define-constant ERR_STRING_TOO_LONG (err u404))

;; Business Logic Constants
(define-constant PREDICTION_UP "up")
(define-constant PREDICTION_DOWN "down")
(define-constant MAX_FEE_PERCENTAGE u10) ;; 10% maximum fee cap
(define-constant MINIMUM_MARKET_DURATION u144) ;; ~24 hours in blocks
(define-constant MAXIMUM_ASSET_NAME_LENGTH u32) ;; Asset name character limit
(define-constant BLOCKS_PER_DAY u144) ;; Approximate blocks per day

;; PROTOCOL STATE MANAGEMENT

;; Core Configuration Variables
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum stake
(define-data-var platform-fee-percentage uint u2) ;; 2% platform fee
(define-data-var market-counter uint u0)
(define-data-var protocol-paused bool false)

;; Protocol Analytics & Statistics
(define-data-var total-volume uint u0)
(define-data-var total-fees-collected uint u0)
(define-data-var total-payouts uint u0)
(define-data-var active-markets-count uint u0)

;; DATA ARCHITECTURE

;; Comprehensive Market Data Structure
(define-map markets
  uint
  {
    creator: principal,
    asset-name: (string-ascii 32),
    start-price: uint,
    end-price: uint,
    total-up-stake: uint,
    total-down-stake: uint,
    start-block: uint,
    end-block: uint,
    resolution-block: uint,
    resolved: bool,
    total-participants: uint,
    creation-block: uint,
  }
)