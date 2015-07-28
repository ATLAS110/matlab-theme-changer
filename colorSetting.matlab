classdef colorSetting < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here    
    properties (Constant = true, Access = public)
        % Ugly Enum Workaround pt. 1:
        M_KEYWORDS = 'M_KEYWORDS';
        M_COMMENTS = 'M_COMMENTS';
        M_STRINGS = 'M_STRINGS';
        M_UNTERMINATED_STRINGS = 'M_UNTERMINATED_STRINGS';
        M_SYSTEM_COMMANDS = 'M_SYSTEM_COMMANDS';
        M_ERRORS = 'M_ERRORS';
        M_COLORS = 'M_COLORS';
        CMD_WIN_ERRORS_COLOR = 'CMD_WIN_ERRORS_COLOR';
        CMD_WIN_WARNINGS_COLOR = 'CMD_WIN_WARNINGS_COLOR';
        HYPERLINK_COLOR = 'HYPERLINK_COLOR';
        HTML_COLORS = 'HTML_COLORS';
        TEXT_COLOR = 'TEXT_COLOR';
        BACKGROUND_COLOR = 'BACKGROUND_COLOR';
        SEARCH_RESULT_HIGHLIGHT = 'SEARCH_RESULT_HIGHLIGHT';
        M_WARNINGS = 'M_WARNINGS';
        MLINT_AUTOFIX_BACKGROUND_COLOR = 'MLINT_AUTOFIX_BACKGROUND_COLOR';
        EDITOR_VAR_HLIGHT = 'EDITOR_VAR_HLIGHT';
        EDITOR_NONLOCAL_VAR_HLIGHT = 'EDITOR_NONLOCAL_VAR_HLIGHT';
        EDITOR_CELL_HLIGHT = 'EDITOR_CELL_HLIGHT';
        USE_SYSTEM_COLORS = 'USE_SYSTEM_COLORS';
        USE_MLINT_AUTOFIX_BACKGROUND = 'USE_MLINT_AUTOFIX_BACKGROUND';       
    end
    
    properties (SetAccess = private, GetAccess = public)
        colorPrefName      
        colorPrefSetting
    end
    
    methods
        function this = colorSetting(prefName, prefSetting)
        % Ugly Enum Workaround pt. 2:        
        validColorNames = struct('PrefName',{'TEXT_COLOR';'BACKGROUND_COLOR';...
          'USE_SYSTEM_COLORS';'M_COLORS';'HTML_COLORS';'HYPERLINK_COLOR';...
          'SEARCH_RESULT_HIGHLIGHT'; 'CMD_WIN_WARNINGS_COLOR';...
          'CMD_WIN_ERRORS_COLOR';'M_KEYWORDS';'M_COMMENTS';'M_STRINGS';...
          'M_UNTERMINATED_STRINGS';'M_SYSTEM_COMMANDS';'M_WARNINGS';...
          'M_ERRORS';'USE_MLINT_AUTOFIX_BACKGROUND';...
          'MLINT_AUTOFIX_BACKGROUND_COLOR';'EDITOR_VAR_HLIGHT';...
          'EDITOR_CELL_HLIGHT';'EDITOR_NONLOCAL_VAR_HLIGHT'},'PrefString',...
          {'ColorsText';'ColorsBackground'; 'ColorsUseSystem'; 'Colors_M_';...
          'Colors_HTML_'; 'Colors_HTML_HTMLLinks'; 'ColorsSearchResult';...
          'Color_CmdWinWarnings'; 'Color_CmdWinErrors';...
          'Colors_M_Keywords'; 'Colors_M_Comments'; 'Colors_M_Strings';...
          'Colors_M_UnterminatedStrings'; 'Colors_M_SystemCommands';...
          'Colors_M_Warnings'; 'Colors_M_Errors';...
          'ColorsUseMLintAutoFixBackground'; 'ColorsMLintAutoFixBackground';...
          'Editor.VariableHighlighting.Color';'Editorhighlight-lines';...
          'Editor.NonlocalVariableHighlighting.TextColor'});  
            %% Input Checks
            assert(any(strcmp({validColorNames.PrefName},prefName)))

            this.colorPrefName = validColorNames(...
                strcmp({validColorNames.PrefName},prefName)). ...
                PrefString;
            this.colorPrefSetting = prefSetting;
        end
    end

end