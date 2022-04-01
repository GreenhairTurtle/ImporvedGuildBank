PLoop(function()

    namespace "ImprovedGuildBank"

    struct "ItemInfo" {
        { name = "name",                type = String,  default = UNKNOWN },
        { name = "link",                type = String,  default = ""    },
        { name = "quality",             type = Number,  default = _G.Enum.ItemQuality.Poor },
        { name = "level",               type = Number,  default = 0     },
        { name = "requiredLevel",       type = Number,  default = 0     },
        { name = "type",                type = String,  default = UNKNOWN },
        { name = "subType",             type = String,  default = UNKNOWN },
        { name = "stackCount",          type = Number,  default = 0     },
        { name = "equipLocation",       type = String,  default = INVTYPE_NON_EQUIP },
        -- default file id is correspond to Icon/INV_Misc_QuestionMark
        { name = "icon",                type = Number,  default = 134400},
        { name = "sellPrice",           type = Number,  default = 0     },
        { name = "classID",             type = Number,  default = 0     },
        { name = "subclassID",          type = Number,  default = 0     },
        { name = "bindType",            type = Number,  default = 0     },
        { name = "expacID",             type = Number,  default = 0     },
        { name = "setID",               type = Number,  default = 0     },
        { name = "isCraftingReagent",   type = Boolean, default = false }
    }

    -- The guild bank slot info
    struct "GuildBankSlotInfo"(function()
        member "tab"    { Type = NaturalNumber, Require = true  }
        member "index"  { Type = NaturalNumber, Require = true  }
        member "count"  { Type = Number     }
        member "locked" { Type = Boolean    }
        member "item"   { Type = ItemInfo   }
        
        __init = function(info)
            local _, count, locked = GetGuildBankItemInfo(info.tab, info.index)
            info.count = count
            info.locked = locked

            if count > 0 and not locked then
                local link = GetGuildBankItemLink(info.tab, info.index)
                info.item = link and ItemInfo(GetItemInfo(link))
            end
        end

        function IsValid(info)
            return info.item and info.count and info.count > 0 and not info.locked
        end

    end)
end)