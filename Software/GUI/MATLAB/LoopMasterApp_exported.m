classdef LoopMasterApp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        stopButton             matlab.ui.control.Button
        StylesButtonGroup      matlab.ui.container.ButtonGroup
        Style1Button           matlab.ui.control.ToggleButton
        Style2Button           matlab.ui.control.ToggleButton
        Style3Button           matlab.ui.control.ToggleButton
        Style4Button           matlab.ui.control.ToggleButton
        Style5Button           matlab.ui.control.ToggleButton
        Style6Button           matlab.ui.control.ToggleButton
        BPMSpinnerLabel        matlab.ui.control.Label
        BPMSpinner             matlab.ui.control.Spinner
        PlayButton             matlab.ui.control.StateButton
        RecordSwitchLabel      matlab.ui.control.Label
        RecordSwitch           matlab.ui.control.Switch
        LoopMasterLabel        matlab.ui.control.Label
        MajMinSwitch           matlab.ui.control.RockerSwitch
        PlayingModeSwitch      matlab.ui.control.RockerSwitch
        DeleteRecordingButton  matlab.ui.control.Button
        ExportRecordingButton  matlab.ui.control.Button
        EEEmerge2020Label      matlab.ui.control.Label
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

        % Button pushed function: stopButton
        function stopButtonPushed(app, event)
            % Add stop functionality here
            fprintf(app.a, 'z');
        end

        % Selection changed function: StylesButtonGroup
        function StylesButtonGroupSelectionChanged(app, event)
            selectedButton = app.StylesButtonGroup.SelectedObject.Text;
            switch selectedButton
                case 'Style 1'
                    fprintf(app.a, 'a');
                case 'Style 2'
                    fprintf(app.a, 'b');
                case 'Style 3'
                    fprintf(app.a, 'c');
                case 'Style 4'
                    fprintf(app.a, 'd');
                case 'Style 5'
                    fprintf(app.a, 'e');
                case 'Style 6'
                    fprintf(app.a, 'f'); 
            end
        end

        % Value changed function: BPMSpinner
        function BPMSpinnerValueChanged(app, event)
            value = app.BPMSpinner.Value + 88;
            fprintf(app.a, value);
        end

        % Value changed function: PlayButton
        function PlayButtonValueChanged(app, event)
            value = app.PlayButton.Value;
            if value
                app.PlayButton.Text = 'Pause';
                fprintf(app.a, 'g');
            else
                app.PlayButton.Text = 'Play';
                fprintf(app.a, 'h');
            end
        end

        % Value changed function: RecordSwitch
        function RecordSwitchValueChanged(app, event)
            value = app.RecordSwitch.Value;
            if strcmpi(value, 'On')
                fprintf(app.a, 'i');
            elseif strcmpi(value, 'Off')
                fprintf(app.a, 'j');
            end
        end

        % Value changed function: MajMinSwitch
        function MajMinSwitchValueChanged(app, event)
            value = app.MajMinSwitch.Value;
            if strcmpi(value, 'Minor')
                fprintf(app.a, 'k');
            elseif strcmpi(value, 'Major')
                fprintf(app.a, 'l');
            end
        end

        % Value changed function: PlayingModeSwitch
        function PlayingModeSwitchValueChanged(app, event)
            value = app.PlayingModeSwitch.Value;
            if strcmpi(value, 'Performance')
                fprintf(app.a, 'm');
            elseif strcmpi(value, 'Practice')
                fprintf(app.a, 'n');
            end
        end

        % Button pushed function: DeleteRecordingButton
        function DeleteRecordingButtonPushed(app, event)
            fprintf(app.a, 'o');
        end

        % Button pushed function: ExportRecordingButton
        function ExportRecordingButtonPushed(app, event)
            fprintf(app.a, 'p');
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
            app.stopButton.Position = [519 16 100 22];
            app.stopButton.Text = 'Stop';

            % Create StylesButtonGroup
            app.StylesButtonGroup = uibuttongroup(app.UIFigure);
            app.StylesButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @StylesButtonGroupSelectionChanged, true);
            app.StylesButtonGroup.Title = 'Styles';
            app.StylesButtonGroup.FontWeight = 'bold';
            app.StylesButtonGroup.Position = [25 300 123 164];

            % Create Style1Button
            app.Style1Button = uitogglebutton(app.StylesButtonGroup);
            app.Style1Button.Text = 'Style 1';
            app.Style1Button.Position = [11 111 100 22];
            app.Style1Button.Value = true;

            % Create Style2Button
            app.Style2Button = uitogglebutton(app.StylesButtonGroup);
            app.Style2Button.Text = 'Style 2';
            app.Style2Button.Position = [11 90 100 22];

            % Create Style3Button
            app.Style3Button = uitogglebutton(app.StylesButtonGroup);
            app.Style3Button.Text = 'Style 3';
            app.Style3Button.Position = [11 69 100 22];

            % Create Style4Button
            app.Style4Button = uitogglebutton(app.StylesButtonGroup);
            app.Style4Button.Text = 'Style 4';
            app.Style4Button.Position = [11 48 100 22];

            % Create Style5Button
            app.Style5Button = uitogglebutton(app.StylesButtonGroup);
            app.Style5Button.Text = 'Style 5';
            app.Style5Button.Position = [11 27 100 22];

            % Create Style6Button
            app.Style6Button = uitogglebutton(app.StylesButtonGroup);
            app.Style6Button.Text = 'Style 6';
            app.Style6Button.Position = [11 6 100 22];

            % Create BPMSpinnerLabel
            app.BPMSpinnerLabel = uilabel(app.UIFigure);
            app.BPMSpinnerLabel.HorizontalAlignment = 'right';
            app.BPMSpinnerLabel.Position = [291 189 32 22];
            app.BPMSpinnerLabel.Text = 'BPM';

            % Create BPMSpinner
            app.BPMSpinner = uispinner(app.UIFigure);
            app.BPMSpinner.Limits = [40 160];
            app.BPMSpinner.RoundFractionalValues = 'on';
            app.BPMSpinner.ValueDisplayFormat = '%.0f';
            app.BPMSpinner.ValueChangedFcn = createCallbackFcn(app, @BPMSpinnerValueChanged, true);
            app.BPMSpinner.Position = [338 189 100 22];
            app.BPMSpinner.Value = 80;

            % Create PlayButton
            app.PlayButton = uibutton(app.UIFigure, 'state');
            app.PlayButton.ValueChangedFcn = createCallbackFcn(app, @PlayButtonValueChanged, true);
            app.PlayButton.Text = 'Play';
            app.PlayButton.Position = [520 50 100 22];

            % Create RecordSwitchLabel
            app.RecordSwitchLabel = uilabel(app.UIFigure);
            app.RecordSwitchLabel.HorizontalAlignment = 'center';
            app.RecordSwitchLabel.FontWeight = 'bold';
            app.RecordSwitchLabel.Position = [46.5 111 47 22];
            app.RecordSwitchLabel.Text = 'Record';

            % Create RecordSwitch
            app.RecordSwitch = uiswitch(app.UIFigure, 'slider');
            app.RecordSwitch.ValueChangedFcn = createCallbackFcn(app, @RecordSwitchValueChanged, true);
            app.RecordSwitch.Position = [47 80 45 20];

            % Create LoopMasterLabel
            app.LoopMasterLabel = uilabel(app.UIFigure);
            app.LoopMasterLabel.HorizontalAlignment = 'center';
            app.LoopMasterLabel.FontName = 'TI-Nspire';
            app.LoopMasterLabel.FontSize = 20;
            app.LoopMasterLabel.Position = [302 432 126 29];
            app.LoopMasterLabel.Text = 'LoopMaster';

            % Create MajMinSwitch
            app.MajMinSwitch = uiswitch(app.UIFigure, 'rocker');
            app.MajMinSwitch.Items = {'Minor', 'Major'};
            app.MajMinSwitch.ValueChangedFcn = createCallbackFcn(app, @MajMinSwitchValueChanged, true);
            app.MajMinSwitch.Position = [135 59 20 45];
            app.MajMinSwitch.Value = 'Major';

            % Create PlayingModeSwitch
            app.PlayingModeSwitch = uiswitch(app.UIFigure, 'rocker');
            app.PlayingModeSwitch.Items = {'Performance', 'Practice'};
            app.PlayingModeSwitch.ValueChangedFcn = createCallbackFcn(app, @PlayingModeSwitchValueChanged, true);
            app.PlayingModeSwitch.Position = [201 59 20 45];
            app.PlayingModeSwitch.Value = 'Practice';

            % Create DeleteRecordingButton
            app.DeleteRecordingButton = uibutton(app.UIFigure, 'push');
            app.DeleteRecordingButton.ButtonPushedFcn = createCallbackFcn(app, @DeleteRecordingButtonPushed, true);
            app.DeleteRecordingButton.Position = [208 306 108 22];
            app.DeleteRecordingButton.Text = 'Delete Recording';

            % Create ExportRecordingButton
            app.ExportRecordingButton = uibutton(app.UIFigure, 'push');
            app.ExportRecordingButton.ButtonPushedFcn = createCallbackFcn(app, @ExportRecordingButtonPushed, true);
            app.ExportRecordingButton.Position = [400 306 108 22];
            app.ExportRecordingButton.Text = 'Export Recording';

            % Create EEEmerge2020Label
            app.EEEmerge2020Label = uilabel(app.UIFigure);
            app.EEEmerge2020Label.Position = [533 461 101 22];
            app.EEEmerge2020Label.Text = 'EE-Emerge 2020 ';

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