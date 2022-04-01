Scorpio "ImprovedGuildBank.Sort" ""

-- Create sort button
SortButton = Button("GuildBankSortButton", GuildBankFrame)
SortButton:SetSize(18, 18)
SortButton:SetPoint("RIGHT", GuildItemSearchBox, "LEFT", -8, 0)
SortButton:SetNormalAtlas("bags-button-autosort-up")
SortButton:SetPushedAtlas("bags-button-autosort-down")
SortButton:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]], "ADD")
SortButton.OnEnter = function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine(L["guildbank_sort_button_tooltip"], nil, nil, nil, true)
    GameTooltip:Show()
end
SortButton.OnLeave = function(self)
    GameTooltip:Hide()
end
SortButton.OnClick = function(self)
    Sort()
end

__AsyncSingle__()
function Sort()
    if not CanSortTab() then
        return ShowError(L["guildbank_cannot_withdraw"])
    end
    
    local slotInfos = GetGuildBankTabSlotInfos()
    MergeItems(slotInfos)
end

function MergeItems(slotInfos)
    if not Option.Sort.MergeItems then return end

    local paths = {}
    for index, slotInfo in ipairs(slotInfos) do
        local item = slotInfo.item
        -- This item need merge
        if item and slotInfo.count < item.stackCount then
            for i = index + 1, #slotInfos do
                -- Necessary check, as it may be full stack in preview loop
                if slotInfo.count >= item.stackCount then break end

                local compareSlotInfo = slotInfos[i]
                local compareItem = compareSlotInfo.item
                
                -- Same item, merge them
                if compareItem and compareItem.link == item.link and compareSlotInfo.count < item.stackCount then
                    -- @todo
                    local path = {}
                end
            end
        end
    end
end
