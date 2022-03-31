Scorpio "ImprovedGuildBank" ""

L = _Locale
local oGetItemInfo = _G.GetItemInfo

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

__Arguments__{ NaturalNumber + NEString }:Throwable()
__Async__(true)
function GetItemInfo(item)
    local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
    itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType, expacID, setID, isCraftingReagent = oGetItemInfo(item)

    if itemName then
        return itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
        itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType, expacID, setID, isCraftingReagent
    end
    
    local exists = C_Item.DoesItemExistByID(item)
    if not exists then
        throw("The item:" .. item .. " is not exists")
    end

    -- Wait(3, "ITEM_DATA_LOAD_RESULT")
    
    -- itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
    --     itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType, expacID, setID, isCraftingReagent = oGetItemInfo(item)

    
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