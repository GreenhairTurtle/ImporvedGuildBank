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
    if CanSortTab() then
        return ShowError(L["guildbank_cannot_withdraw"])
    end
    
end

function MergeItems()
    if not Option.Sort.MergeItems then return end


end
