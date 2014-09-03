function [fig] = setup_lunghao1_gui(lh1)

fig = figure; clf; 
Dio_Hi_Dur     = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.7 0.9 0.29 0.085], ...
    'String', 'Dio_Hi_Dur=');
Dio_Hi_Bits    = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.7 0.8 0.29 0.085], ...
    'String', 'Dio_Hi_Bits=');
Bits_HighVal   = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.7 0.7 0.29 0.085], ...
    'String', 'Bits_HighVal=');
AOBits_HighVal = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.7 0.6 0.29 0.085], ...
    'String', 'AOBits_HighVal=');
running        = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.7 0.5 0.29 0.085], ...
    'String', 'running=');
EventCounter   = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.7 0.4 0.29 0.085], ...
    'String', 'EventCounter=');

set([Dio_Hi_Dur;Dio_Hi_Bits;Bits_HighVal;AOBits_HighVal;running;EventCounter], 'FontSize', 10, 'FontWeight', 'Bold');

statebutton = uicontrol(fig, 'Style', 'PushButton', 'Units', 'normalized', 'Position', [0.01 0.78 0.19 0.1], ...
    'String', 'State = 0', 'FontSize', 10, 'FontWeight', 'bold');
timerbutton = uicontrol(fig, 'Style', 'PushButton', 'Units', 'normalized', 'Position', [0.01 0.88 0.19 0.1], ...
    'String', 'Timer = ', 'FontSize', 10, 'FontWeight', 'bold');
doutbutton  = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.6 0.01 0.19 0.14], ...
    'String', 'DOut = 00000000', 'FontSize', 10, 'FontWeight', 'bold');
aoutbutton  = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.38 0.01 0.21 0.14], ...
    'String', 'AOut = 0.0  0.0', 'FontSize', 10, 'FontWeight', 'bold');

leftbutton   = uicontrol(fig, 'Style', 'PushButton', 'Units', 'normalized', 'Position', [0.21 0.525 0.125 0.125], ...
    'String', 'Left',   'BackGroundColor', 'g');
centerbutton = uicontrol(fig, 'Style', 'PushButton', 'Units', 'normalized', 'Position', [0.36 0.525 0.125 0.125], ...
    'String', 'Center', 'BackGroundColor', 'g');
rightbutton  = uicontrol(fig, 'Style', 'PushButton', 'Units', 'normalized', 'Position', [0.51 0.525 0.125 0.125], ...
    'String', 'Right',  'BackGroundColor', 'g');
outbutton    = uicontrol(fig, 'Style', 'PushButton', 'Units', 'normalized', 'Position', [0.21 0.4 0.425 0.125], ...
    'String', 'Out',    'BackGroundColor', 'c');
leftwater    = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.21 0.65 0.125 0.07], ...
    'String', 'w', 'BackGroundColor', [0.8 0.8 0.8], 'ForeGroundColor', 'b');
rightwater   = uicontrol(fig, 'Style', 'Text', 'Units', 'normalized', 'Position', [0.51 0.65 0.125 0.07], ...
    'String', 'w', 'BackGroundColor', [0.8 0.8 0.8], 'ForeGroundColor', 'b');
set([leftbutton;centerbutton;rightbutton;outbutton], 'FontSize', 10, 'FontWeight', 'bold', ...
    'Callback', 'ratpos_callback', 'BusyAction', 'cancel');
set([leftwater;rightwater], 'FontSize', 10, 'FontWeight', 'bold', 'Visible', 'off');


drawnow;

set(fig, 'Position', [966 838 460 320], ...
    'NumberTitle', 'off', 'Name', ['lunghao1 - ' num2str(GetTagVal(lh1, 'list_position'))], ...
    'UserData', { ...
        'statebutton'     statebutton ; ...
        'timerbutton'     timerbutton ; ...
        'doutbutton'      doutbutton  ; ...
        'aoutbutton'      aoutbutton  ; ...
        'centerbutton'    centerbutton ; ...
        'leftbutton'      leftbutton ; ...
        'rightbutton'     rightbutton ; ...
        'outbutton'       outbutton ; ...
        'leftwater'       leftwater  ; ...
        'rightwater'      rightwater ; ...
        'pos'             'Out' ; ...
        'lh1'             lh1   ; ...
        'Dio_Hi_Dur'      Dio_Hi_Dur   ; ...
        'Dio_Hi_Bits'     Dio_Hi_Bits  ; ...
        'Bits_HighVal'    Bits_HighVal ; ...
        'AOBits_HighVal'  AOBits_HighVal ; ...
        'running'         running ; ...
        'EventCounter'    EventCounter ; ...
    });

set(fig, 'WindowButtonMotionFcn', {@ratmotion_callback, get(leftbutton, 'Position'), ...
        get(centerbutton, 'Position'), get(rightbutton, 'Position'), get(outbutton, 'Position')}, ...
    'Interruptible', 'off', 'BusyAction', 'cancel');

set(lh1, 'UserData', fig, ...
    'statechange_callback', 'lunghao1_gui_statechange_callback', ...
    'doutchange_callback',  'lunghao1_gui_doutchange_callback', ...
    'aoutchange_callback',  'lunghao1_gui_aoutchange_callback');
