classdef LoopMasterAppConcept < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        Menu                    matlab.ui.container.Menu
        SaveMenu                matlab.ui.container.Menu
        ExportMenu              matlab.ui.container.Menu
        stopButton              matlab.ui.control.Button
        InstrumentsButtonGroup  matlab.ui.container.ButtonGroup
        DrumsButton             matlab.ui.control.ToggleButton
        KeyboardButton          matlab.ui.control.ToggleButton
        GuitarButton            matlab.ui.control.ToggleButton
        BPMSpinnerLabel         matlab.ui.control.Label
        BPMSpinner              matlab.ui.control.Spinner
        PlayButton              matlab.ui.control.StateButton
        LoopSwitchLabel         matlab.ui.control.Label
        LoopSwitch              matlab.ui.control.Switch
        RecordSwitchLabel       matlab.ui.control.Label
        RecordSwitch            matlab.ui.control.Switch
        LoopMasterLabel         matlab.ui.control.Label
        CurrentKeyLabel         matlab.ui.control.Label
        KeyButtonGroup          matlab.ui.container.ButtonGroup
        GButton                 matlab.ui.control.ToggleButton
        CButton                 matlab.ui.control.ToggleButton
        DButton                 matlab.ui.control.ToggleButton
        AButton                 matlab.ui.control.ToggleButton
        KeyLabel                matlab.ui.control.Label
        MajMinSwitch            matlab.ui.control.RockerSwitch
        MajMinLabel             matlab.ui.control.Label
        CurrentInstrumentLabel  matlab.ui.control.Label
        InstrumentLabel         matlab.ui.control.Label
        PlayingModeSwitch       matlab.ui.control.RockerSwitch
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: stopButton
        function stopButtonPushed(app, event)
            % Add stop functionality here
        end

        % Selection changed function: InstrumentsButtonGroup
        function InstrumentsButtonGroupSelectionChanged(app, event)
            selectedButton = app.InstrumentsButtonGroup.SelectedObject.Text;
            app.InstrumentLabel.Text = selectedButton;
            switch selectedButton
                case 'Drums'
                    % Implement drum output
                case 'Keyboard'
                    % Implement keyboard output
                case 'Guitar'
                    % Implement guitar output
            end
        end

        % Menu selected function: SaveMenu
        function SaveMenuSelected(app, event)
            % Implement save logic
        end

        % Menu selected function: ExportMenu
        function ExportMenuSelected(app, event)
            % Implement exporting logic
        end

        % Value changed function: BPMSpinner
        function BPMSpinnerValueChanged(app, event)
            value = app.BPMSpinner.Value;
            % Add BPM logic
        end

        % Value changed function: PlayButton
        function PlayButtonValueChanged(app, event)
            value = app.PlayButton.Value;
            if value
                app.PlayButton.Text = 'Pause';
                % Implement play logic
            else
                app.PlayButton.Text = 'Play';
                % Implement pause logic
            end
        end

        % Value changed function: LoopSwitch
        function LoopSwitchValueChanged(app, event)
            value = app.LoopSwitch.Value;
            if strcmpi(value, 'On')
                % Implement looping logic
            elseif strcmpi(value, 'Off')
                % Turn off looping logic
            end
        end

        % Value changed function: RecordSwitch
        function RecordSwitchValueChanged(app, event)
            value = app.RecordSwitch.Value;
            if strcmpi(value, 'On')
                % Implement recording logic
            elseif strcmpi(value, 'Off')
                % Implement strictly writing logic
            end
        end

        % Selection changed function: KeyButtonGroup
        function KeyButtonGroupSelectionChanged(app, event)
            selectedButton = app.KeyButtonGroup.SelectedObject.Text;
            app.KeyLabel.Text = selectedButton;
            switch selectedButton
                % Change buttons and below as needed
                case 'G'
                    % Implement
                case 'C'
                    % Implement
                case 'D'
                    % Implement
                case 'A'
                    % Implement
            end
        end

        % Value changed function: MajMinSwitch
        function MajMinSwitchValueChanged(app, event)
            value = app.MajMinSwitch.Value;
            if strcmpi(value, 'Minor')
                app.MajMinLabel.Visible = 'on';
                % Implement minor functionality
            elseif strcmpi(value, 'Major')
                app.MajMinLabel.Visible = 'off';
                % Implement major functionality
            end
        end

        % Value changed function: PlayingModeSwitch
        function PlayingModeSwitchValueChanged(app, event)
            value = app.PlayingModeSwitch.Value;
            if strcmpi(value, 'Performance')
                % Implement performance mode
            elseif strcmpi(value, 'Practice')
                % Implement practice mode
            end
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

            % Create Menu
            app.Menu = uimenu(app.UIFigure);
            app.Menu.Text = 'Menu';

            % Create SaveMenu
            app.SaveMenu = uimenu(app.Menu);
            app.SaveMenu.MenuSelectedFcn = createCallbackFcn(app, @SaveMenuSelected, true);
            app.SaveMenu.Text = 'Save';

            % Create ExportMenu
            app.ExportMenu = uimenu(app.Menu);
            app.ExportMenu.MenuSelectedFcn = createCallbackFcn(app, @ExportMenuSelected, true);
            app.ExportMenu.Text = 'Export';

            % Create stopButton
            app.stopButton = uibutton(app.UIFigure, 'push');
            app.stopButton.ButtonPushedFcn = createCallbackFcn(app, @stopButtonPushed, true);
            app.stopButton.Position = [519 16 100 22];
            app.stopButton.Text = 'Stop';

            % Create InstrumentsButtonGroup
            app.InstrumentsButtonGroup = uibuttongroup(app.UIFigure);
            app.InstrumentsButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @InstrumentsButtonGroupSelectionChanged, true);
            app.InstrumentsButtonGroup.Title = 'Instruments';
            app.InstrumentsButtonGroup.FontWeight = 'bold';
            app.InstrumentsButtonGroup.Position = [25 358 123 106];

            % Create DrumsButton
            app.DrumsButton = uitogglebutton(app.InstrumentsButtonGroup);
            app.DrumsButton.Text = 'Drums';
            app.DrumsButton.Position = [11 53 100 22];
            app.DrumsButton.Value = true;

            % Create KeyboardButton
            app.KeyboardButton = uitogglebutton(app.InstrumentsButtonGroup);
            app.KeyboardButton.Text = 'Keyboard';
            app.KeyboardButton.Position = [11 32 100 22];

            % Create GuitarButton
            app.GuitarButton = uitogglebutton(app.InstrumentsButtonGroup);
            app.GuitarButton.Text = 'Guitar';
            app.GuitarButton.Position = [11 11 100 22];

            % Create BPMSpinnerLabel
            app.BPMSpinnerLabel = uilabel(app.UIFigure);
            app.BPMSpinnerLabel.HorizontalAlignment = 'right';
            app.BPMSpinnerLabel.Position = [246 132 32 22];
            app.BPMSpinnerLabel.Text = 'BPM';

            % Create BPMSpinner
            app.BPMSpinner = uispinner(app.UIFigure);
            app.BPMSpinner.ValueChangedFcn = createCallbackFcn(app, @BPMSpinnerValueChanged, true);
            app.BPMSpinner.Position = [293 132 100 22];
            app.BPMSpinner.Value = 80;

            % Create PlayButton
            app.PlayButton = uibutton(app.UIFigure, 'state');
            app.PlayButton.ValueChangedFcn = createCallbackFcn(app, @PlayButtonValueChanged, true);
            app.PlayButton.Text = 'Play';
            app.PlayButton.Position = [520 50 100 22];

            % Create LoopSwitchLabel
            app.LoopSwitchLabel = uilabel(app.UIFigure);
            app.LoopSwitchLabel.HorizontalAlignment = 'center';
            app.LoopSwitchLabel.FontWeight = 'bold';
            app.LoopSwitchLabel.Position = [51.5 50 35 22];
            app.LoopSwitchLabel.Text = 'Loop';

            % Create LoopSwitch
            app.LoopSwitch = uiswitch(app.UIFigure, 'slider');
            app.LoopSwitch.ValueChangedFcn = createCallbackFcn(app, @LoopSwitchValueChanged, true);
            app.LoopSwitch.Position = [48 19 45 20];

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
            app.LoopMasterLabel.Position = [267 435 103 29];
            app.LoopMasterLabel.Text = 'LoopMaster';

            % Create CurrentKeyLabel
            app.CurrentKeyLabel = uilabel(app.UIFigure);
            app.CurrentKeyLabel.Position = [252 78 73 22];
            app.CurrentKeyLabel.Text = 'Current Key:';

            % Create KeyButtonGroup
            app.KeyButtonGroup = uibuttongroup(app.UIFigure);
            app.KeyButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @KeyButtonGroupSelectionChanged, true);
            app.KeyButtonGroup.Title = 'Key';
            app.KeyButtonGroup.FontWeight = 'bold';
            app.KeyButtonGroup.Position = [25 218 123 126];

            % Create GButton
            app.GButton = uitogglebutton(app.KeyButtonGroup);
            app.GButton.Text = 'G';
            app.GButton.Position = [11 73 100 22];
            app.GButton.Value = true;

            % Create CButton
            app.CButton = uitogglebutton(app.KeyButtonGroup);
            app.CButton.Text = 'C';
            app.CButton.Position = [11 52 100 22];

            % Create DButton
            app.DButton = uitogglebutton(app.KeyButtonGroup);
            app.DButton.Text = 'D';
            app.DButton.Position = [11 31 100 22];

            % Create AButton
            app.AButton = uitogglebutton(app.KeyButtonGroup);
            app.AButton.Text = 'A';
            app.AButton.Position = [11 10 100 22];

            % Create KeyLabel
            app.KeyLabel = uilabel(app.UIFigure);
            app.KeyLabel.Position = [322 78 25 22];
            app.KeyLabel.Text = 'G';

            % Create MajMinSwitch
            app.MajMinSwitch = uiswitch(app.UIFigure, 'rocker');
            app.MajMinSwitch.Items = {'Minor', 'Major'};
            app.MajMinSwitch.ValueChangedFcn = createCallbackFcn(app, @MajMinSwitchValueChanged, true);
            app.MajMinSwitch.Position = [135 59 20 45];
            app.MajMinSwitch.Value = 'Major';

            % Create MajMinLabel
            app.MajMinLabel = uilabel(app.UIFigure);
            app.MajMinLabel.Visible = 'off';
            app.MajMinLabel.Position = [333 78 28 22];
            app.MajMinLabel.Text = 'm';

            % Create CurrentInstrumentLabel
            app.CurrentInstrumentLabel = uilabel(app.UIFigure);
            app.CurrentInstrumentLabel.Position = [252 57 109 22];
            app.CurrentInstrumentLabel.Text = 'Current Instrument:';

            % Create InstrumentLabel
            app.InstrumentLabel = uilabel(app.UIFigure);
            app.InstrumentLabel.Position = [360 57 92 22];
            app.InstrumentLabel.Text = 'Drums';

            % Create PlayingModeSwitch
            app.PlayingModeSwitch = uiswitch(app.UIFigure, 'rocker');
            app.PlayingModeSwitch.Items = {'Performance', 'Practice'};
            app.PlayingModeSwitch.ValueChangedFcn = createCallbackFcn(app, @PlayingModeSwitchValueChanged, true);
            app.PlayingModeSwitch.Position = [201 59 20 45];
            app.PlayingModeSwitch.Value = 'Practice';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = LoopMasterAppConcept

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

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