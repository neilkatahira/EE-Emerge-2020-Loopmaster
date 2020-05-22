classdef LoopMasterApp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        stopButton               matlab.ui.control.Button
        StylesButtonGroup        matlab.ui.container.ButtonGroup
        EDMButton                matlab.ui.control.ToggleButton
        FunkButton               matlab.ui.control.ToggleButton
        EasternButton            matlab.ui.control.ToggleButton
        HouseButton              matlab.ui.control.ToggleButton
        DrumMachineButton        matlab.ui.control.ToggleButton
        HipHopButton             matlab.ui.control.ToggleButton
        RnBButton                matlab.ui.control.ToggleButton
        ChillButton              matlab.ui.control.ToggleButton
        PlayButton               matlab.ui.control.StateButton
        LoopMasterLabel          matlab.ui.control.Label
        LoopsSwitchLabel         matlab.ui.control.Label
        SoundEffectsSwitchLabel  matlab.ui.control.Label
        SoundEffectsSwitch       matlab.ui.control.ToggleSwitch
        RecordingSwitchLabel     matlab.ui.control.Label
        RecordingSwitch          matlab.ui.control.ToggleSwitch
        LoopsSwitch              matlab.ui.control.ToggleSwitch
        DeleteRecordingButton    matlab.ui.control.Button
        EEEmerge2020Label        matlab.ui.control.Label
        ClearLoopsButton         matlab.ui.control.Button
        ClearSoundEffectsButton  matlab.ui.control.Button
    end

    
    properties (Access = private)
        a % Arduino
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            clear a;
            clc % Clear opened COM ports
            if ~isempty(instrfind)
                fclose(instrfind);
                delete(instrfind);
            end
            clc
            app.a = serial('COM3', 'BAUD', 115200); % Change COM accordingly.
            fopen(app.a);
        end

        % Selection changed function: StylesButtonGroup
        function StylesButtonGroupSelectionChanged(app, event)
            selectedButton = app.StylesButtonGroup.SelectedObject.Text;
            switch selectedButton
                case 'EDM'
                    fprintf(app.a, 'a');
                case 'Funk'
                    fprintf(app.a, 'b');
                case 'Eastern'
                    fprintf(app.a, 'c');
                case 'House'
                    fprintf(app.a, 'd');
                case 'Drum Machine'
                    fprintf(app.a, 'e');
                case 'Hip Hop'
                    fprintf(app.a, 'f');
                case 'RnB'
                    fprintf(app.a, 'g'); 
                case 'Chill'
                    fprintf(app.a, 'h'); 
            end
        end

        % Value changed function: LoopsSwitch
        function LoopsSwitchValueChanged(app, event)
            value = app.LoopsSwitch.Value;
            if strcmpi(value, 'On')
                fprintf(app.a, 'i');
            elseif strcmpi(value, 'Off')
                fprintf(app.a, 'j');
            end
        end

        % Button pushed function: ClearLoopsButton
        function ClearLoopsButtonPushed(app, event)
            fprintf(app.a, 'o');
        end

        % Value changed function: RecordingSwitch
        function RecordingSwitchValueChanged(app, event)
            value = app.RecordingSwitch.Value;
            if strcmpi(value, 'On')
                fprintf(app.a, 'k');
            elseif strcmpi(value, 'Off')
                fprintf(app.a, 'l');
            end
        end

        % Button pushed function: DeleteRecordingButton
        function DeleteRecordingButtonPushed(app, event)
            fprintf(app.a, 'p');
        end

        % Value changed function: SoundEffectsSwitch
        function SoundEffectsSwitchValueChanged(app, event)
            value = app.SoundEffectsSwitch.Value;
            if strcmpi(value, 'On')
                fprintf(app.a, 'm');
            elseif strcmpi(value, 'Off')
                fprintf(app.a, 'n');
            end
        end

        % Button pushed function: ClearSoundEffectsButton
        function ClearSoundEffectsButtonPushed(app, event)
            fprintf(app.a, 'q');
        end

        % Value changed function: PlayButton
        function PlayButtonValueChanged(app, event)
            value = app.PlayButton.Value;
            if value % Want to play
                app.PlayButton.Text = 'Pause';
                fprintf(app.a, 'x');
            else % Want to pause
                app.PlayButton.Text = 'Play';
                fprintf(app.a, 'y');
            end
        end

        % Button pushed function: stopButton
        function stopButtonPushed(app, event)
            % Add stop functionality here
            fprintf(app.a, 'z');
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            clc % Clear opened COM ports
            if ~isempty(instrfind)
                fclose(instrfind);
                delete(instrfind);
            end
            clc
            delete(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 633 482];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create stopButton
            app.stopButton = uibutton(app.UIFigure, 'push');
            app.stopButton.ButtonPushedFcn = createCallbackFcn(app, @stopButtonPushed, true);
            app.stopButton.Position = [44 28 100 22];
            app.stopButton.Text = 'Stop';

            % Create StylesButtonGroup
            app.StylesButtonGroup = uibuttongroup(app.UIFigure);
            app.StylesButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @StylesButtonGroupSelectionChanged, true);
            app.StylesButtonGroup.Title = 'Styles';
            app.StylesButtonGroup.FontWeight = 'bold';
            app.StylesButtonGroup.Position = [33 156 123 209];

            % Create EDMButton
            app.EDMButton = uitogglebutton(app.StylesButtonGroup);
            app.EDMButton.Text = 'EDM';
            app.EDMButton.Position = [11 156 100 22];
            app.EDMButton.Value = true;

            % Create FunkButton
            app.FunkButton = uitogglebutton(app.StylesButtonGroup);
            app.FunkButton.Text = 'Funk';
            app.FunkButton.Position = [11 135 100 22];

            % Create EasternButton
            app.EasternButton = uitogglebutton(app.StylesButtonGroup);
            app.EasternButton.Text = 'Eastern';
            app.EasternButton.Position = [11 114 100 22];

            % Create HouseButton
            app.HouseButton = uitogglebutton(app.StylesButtonGroup);
            app.HouseButton.Text = 'House';
            app.HouseButton.Position = [11 93 100 22];

            % Create DrumMachineButton
            app.DrumMachineButton = uitogglebutton(app.StylesButtonGroup);
            app.DrumMachineButton.Text = 'Drum Machine';
            app.DrumMachineButton.Position = [12 72 100 22];

            % Create HipHopButton
            app.HipHopButton = uitogglebutton(app.StylesButtonGroup);
            app.HipHopButton.Text = 'Hip Hop';
            app.HipHopButton.Position = [11 51 100 22];

            % Create RnBButton
            app.RnBButton = uitogglebutton(app.StylesButtonGroup);
            app.RnBButton.Text = 'RnB';
            app.RnBButton.Position = [11 30 100 22];

            % Create ChillButton
            app.ChillButton = uitogglebutton(app.StylesButtonGroup);
            app.ChillButton.Text = 'Chill';
            app.ChillButton.Position = [11 9 100 22];

            % Create PlayButton
            app.PlayButton = uibutton(app.UIFigure, 'state');
            app.PlayButton.ValueChangedFcn = createCallbackFcn(app, @PlayButtonValueChanged, true);
            app.PlayButton.Text = 'Play';
            app.PlayButton.Position = [44 66 100 22];

            % Create LoopMasterLabel
            app.LoopMasterLabel = uilabel(app.UIFigure);
            app.LoopMasterLabel.HorizontalAlignment = 'center';
            app.LoopMasterLabel.FontName = 'TI-Nspire';
            app.LoopMasterLabel.FontSize = 20;
            app.LoopMasterLabel.Position = [255 414 126 29];
            app.LoopMasterLabel.Text = 'LoopMaster';

            % Create DeleteRecordingButton
            app.DeleteRecordingButton = uibutton(app.UIFigure, 'push');
            app.DeleteRecordingButton.ButtonPushedFcn = createCallbackFcn(app, @DeleteRecordingButtonPushed, true);
            app.DeleteRecordingButton.Position = [183 135 108 22];
            app.DeleteRecordingButton.Text = 'Delete Recording';

            % Create EEEmerge2020Label
            app.EEEmerge2020Label = uilabel(app.UIFigure);
            app.EEEmerge2020Label.Position = [533 461 101 22];
            app.EEEmerge2020Label.Text = 'EE-Emerge 2020 ';

            % Create LoopsSwitchLabel
            app.LoopsSwitchLabel = uilabel(app.UIFigure);
            app.LoopsSwitchLabel.HorizontalAlignment = 'center';
            app.LoopsSwitchLabel.Position = [351 211 38 22];
            app.LoopsSwitchLabel.Text = 'Loops';

            % Create LoopsSwitch
            app.LoopsSwitch = uiswitch(app.UIFigure, 'toggle');
            app.LoopsSwitch.ValueChangedFcn = createCallbackFcn(app, @LoopsSwitchValueChanged, true);
            app.LoopsSwitch.Position = [359 269 20 45];

            % Create SoundEffectsSwitchLabel
            app.SoundEffectsSwitchLabel = uilabel(app.UIFigure);
            app.SoundEffectsSwitchLabel.HorizontalAlignment = 'center';
            app.SoundEffectsSwitchLabel.Position = [464 211 80 22];
            app.SoundEffectsSwitchLabel.Text = 'Sound Effects';

            % Create SoundEffectsSwitch
            app.SoundEffectsSwitch = uiswitch(app.UIFigure, 'toggle');
            app.SoundEffectsSwitch.ValueChangedFcn = createCallbackFcn(app, @SoundEffectsSwitchValueChanged, true);
            app.SoundEffectsSwitch.Position = [493 269 20 45];

            % Create RecordingSwitchLabel
            app.RecordingSwitchLabel = uilabel(app.UIFigure);
            app.RecordingSwitchLabel.HorizontalAlignment = 'center';
            app.RecordingSwitchLabel.Position = [207 211 60 22];
            app.RecordingSwitchLabel.Text = 'Recording';

            % Create RecordingSwitch
            app.RecordingSwitch = uiswitch(app.UIFigure, 'toggle');
            app.RecordingSwitch.ValueChangedFcn = createCallbackFcn(app, @RecordingSwitchValueChanged, true);
            app.RecordingSwitch.Position = [226 269 20 45];

            % Create ClearLoopsButton
            app.ClearLoopsButton = uibutton(app.UIFigure, 'push');
            app.ClearLoopsButton.ButtonPushedFcn = createCallbackFcn(app, @ClearLoopsButtonPushed, true);
            app.ClearLoopsButton.Position = [320 135 100 22];
            app.ClearLoopsButton.Text = 'Clear Loops';

            % Create ClearSoundEffectsButton
            app.ClearSoundEffectsButton = uibutton(app.UIFigure, 'push');
            app.ClearSoundEffectsButton.ButtonPushedFcn = createCallbackFcn(app, @ClearSoundEffectsButtonPushed, true);
            app.ClearSoundEffectsButton.Position = [443 135 122 22];
            app.ClearSoundEffectsButton.Text = 'Clear Sound Effects';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = LoopMasterApp_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end