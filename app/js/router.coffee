angular.module("app").config ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise('/accounts')

    sp = $stateProvider


    sp.state "preferences",
        url: "/preferences"
        templateUrl: "preferences.html"
        controller: "PreferencesController"

    sp.state "console",
        url: "/console"
        templateUrl: "console.html"
        controller: "ConsoleController"

    sp.state "createaccount",
        url: "/create/account"
        templateUrl: "createaccount.html"
        controller: "CreateAccountController"

    sp.state "accounts",
        url: "/accounts"
        templateUrl: "accounts.html"
        controller: "AccountsController"

    sp.state "delegates",
        url: "/delegates"
        templateUrl: "delegates/delegates.html"
        controller: "DelegatesController"

    sp.state "account",
        url: "/accounts/:name"
        templateUrl: "account.html"
        controller: "AccountController"

    sp.state "account.transactions", { url: "/account_transactions?pending_only", views: { 'account-transactions': { templateUrl: 'account_transactions.html', controller: 'TransactionsController' } } }

    sp.state "account.delegate", { url: "/account_delegate", views: { 'account-delegate': { templateUrl: 'account_delegate.html', controller: 'AccountDelegate' } } }

    sp.state "account.transfer", { url: "/account_transfer?from&to&amount&memo&asset", views: { 'account-transfer': { templateUrl: 'transfer.html', controller: 'TransferController' } } }

    sp.state "account.manageAssets", { url: "/account_assets", views: { 'account-manage-assets': { templateUrl: 'manage_assets.html', controller: 'ManageAssetsController' } } }

    sp.state "account.keys", { url: "/account_keys", views: { 'account-keys': { templateUrl: 'account_keys.html' } } }

    sp.state "account.edit", { url: "/account_edit", views: { 'account-edit': { templateUrl: 'account_edit.html', controller: 'AccountEditController' } } }

    sp.state "account.vote", { url: "/account_vote", views: { 'account-vote': { templateUrl: 'account_vote.html', controller: 'AccountVoteController' } } }

    sp.state "account.wall", { url: "/account_wall", views: { 'account-wall': { templateUrl: 'account_wall.html', controller: 'AccountWallController' } } }

    sp.state "asset",
        url: "/assets/:ticker"
        templateUrl: "asset.html"
        controller: "AssetController"

    sp.state "createwallet",
        url: "/createwallet"
        templateUrl: (
            if window.bts
                "brainwallet.html"
            else
                "createwallet.html"
        )
        controller: (
            if window.bts
                "BrainWalletController"
            else
                "CreateWalletController"
        )

    sp.state "block",
        url: "/blocks/:number"
        templateUrl: "block.html"
        controller: "BlockController"

    sp.state "transaction",
        url: "/tx/:id"
        templateUrl: "transaction.html"
        controller: "TransactionController"

    sp.state "unlockwallet",
        url: "/unlockwallet"
        templateUrl: (
            if window.bts
                "brainwallet.html"
            else
                "unlockwallet.html"
        )
        controller: (
            if window.bts
                "BrainWalletController"
            else
                "UnlockWalletController"
        )

    sp.state "brainwallet",
        url: "/brainwallet"
        templateUrl: "brainwallet.html"
        controller: "BrainWalletController"

    sp.state "markets",
        url: "/markets"
        templateUrl: "market/markets.html"
        controller: "MarketsController"

    sp.state "market",
        abstract: true
        url: "/market/:name/:account"
        templateUrl: "market/market.html"
        controller: "MarketController"

    sp.state "market.buy", { url: "/buy", templateUrl: "market/buy.html" }
    sp.state "market.sell", { url: "/sell", templateUrl: "market/sell.html" }
    sp.state "market.short", { url: "/short", templateUrl: "market/short.html" }

    sp.state "transfer",
        url: "/transfer?from&to&amount&memo&asset"
        templateUrl: "transfer.html"
        controller: "TransferController"

    sp.state "newcontact",
        url: "/newcontact?name&key"
        templateUrl: "newcontact.html"
        controller: "NewContactController"

    sp.state "mail",
        url: "/mail/:box"
        templateUrl: "mail.html"
        controller: "MailController"
    
    sp.state "mail.compose",
        url: "/compose"
        onEnter: ($modal, $state) ->
            modal = $modal.open
                templateUrl: "dialog-mail-compose.html"
                controller: "ComposeMailController"
                
            modal.result.then(
                (result) ->
                    $state.go 'mail'
                () ->
                    $state.go 'mail'
            )
    
    sp.state "mail.show",
        url: "/show/:id"
        onEnter: ($modal, $state) ->
            modal = $modal.open
                templateUrl: "dialog-mail-show.html"
                controller: "ShowMailController"
                
            modal.result.then(
                (result) ->
                    $state.go 'mail'
                () ->
                    $state.go 'mail'
            )

    sp.state "referral_code",
        url: "/referral_code?faucet&code"
        templateUrl: "referral_code.html"
        controller: "ReferralCodeController"

    sp.state "advanced",
        url: "/advanced"
        templateUrl: "advanced/advanced.html"
        controller: "AdvancedController"

    sp.state "advanced.preferences", { url: "/preferences", views: { 'advanced-preferences': { templateUrl: 'advanced/preferences.html', controller: 'PreferencesController' } } }
    sp.state "advanced.console", { url: "/console", views: { 'advanced-console': { templateUrl: 'advanced/console.html', controller: 'ConsoleController' } } }