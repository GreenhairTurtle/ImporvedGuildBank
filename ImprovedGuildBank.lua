Scorpio "ImprovedGuildBank" ""

import "ImprovedGuildBank"

L = _Locale
MAX_GUILDBANK_SLOTS_PER_TAB = 98
DefaultOption                   = {
    Sort                        = {
        -- Whether merge items
        MergeItems              = true,
        -- Pickup interval in seconds
        PickupInterval          = 1.5
    }
}

function OnLoad(self)
    Option = SVManager("ImprovedGuildBankSaved")
    Option:SetDefault(DefaultOption)
end

__Arguments__{ NaturalNumber/nil }
function GetGuildBankTabSlotInfos(tab)
    tab = tab or GetCurrentGuildBankTab()
    
    local slotInfos = {}
    for i = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
        local slotInfo = GuildBankSlotInfo(tab, i)
        if slotInfo:IsValid() then
            tinsert(slotInfos, slotInfo)
        end
    end

    return slotInfos
end

__Arguments__{ NaturalNumber/nil }
function CanSortTab(tab)
    if IsGuildLeader() then return true end

    tab = tab or GetCurrentGuildBankTab()
    local _, _, _, viewable, _, _, remainingWithdrawals = GetGuildBankTabInfo(tab)
    return viewable and remainingWithdrawals > 2
end

__Arguments__{ NEString }
function ShowError(text)
    UIErrorsFrame:AddMessage(text, 1.0, 0.0, 0.0, 1, 3)
end

__Arguments__{ NEString }
function ShowMessage(text)
    UIErrorsFrame:AddMessage(text, 1.0, 0.0, 0.0, 1, 3)
end