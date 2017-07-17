function varargout = NiDaqControlPanel(varargin)
% NIDAQCONTROLPANEL MATLAB code for NiDaqControlPanel.fig
%      NIDAQCONTROLPANEL, by itself, creates a new NIDAQCONTROLPANEL or raises the existing
%      singleton*.
%
%      H = NIDAQCONTROLPANEL returns the handle to a new NIDAQCONTROLPANEL or the handle to
%      the existing singleton*.
%
%      NIDAQCONTROLPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NIDAQCONTROLPANEL.M with the given input arguments.
%
%      NIDAQCONTROLPANEL('Property','Value',...) creates a new NIDAQCONTROLPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NiDaqControlPanel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NiDaqControlPanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NiDaqControlPanel

% Last Modified by GUIDE v2.5 17-Jul-2017 23:18:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NiDaqControlPanel_OpeningFcn, ...
                   'gui_OutputFcn',  @NiDaqControlPanel_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NiDaqControlPanel is made visible.
function NiDaqControlPanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NiDaqControlPanel (see VARARGIN)

% Choose default command line output for NiDaqControlPanel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NiDaqControlPanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NiDaqControlPanel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.popupmenu10.Value
    case 1
        callback_yfNiDaqAiAoB(handles)
    case 2
        callback_yfNiDaqAiAoF(handles)
    case 3
        callback_yfNiDaqAiAoFTrig(handles)
    case 4
        callback_yfNiDaqAiB(handles)
    case 5
        callback_yfNiDaqAiBCont(handles)
    case 6
        callback_yfNiDaqAiF(handles)
    case 7
        callback_yfNiDaqAiFTrig(handles)
    case 8
        callback_yfNiDaqAoB(handles)
    case 9
        callback_yfNiDaqAoBCont(handles)
    case 10
        callback_yfNiDaqAoBContDoConst(handles)
    case 11
        callback_yfNiDaqAoBContDoConstTrig(handles)
    case 12
        callback_yfNiDaqAoBContTrig(handles)
    case 13
        callback_yfNiDaqAoF(handles)
    case 14
        callback_yfNiDaqAoFTrig(handles)
    case 15
        callback_yfNiDaqAoSS(handles)
    case 16
        callback_yfNiDaqDo(handles)
    case 17
        callback_yfNiDaqLoadLog(handles)
    otherwise 
end

function callback_yfNiDaqAiAoB(handles)
rate = str2double(handles.edit1.String);
AoWaveform = handles.axes2.Children.YData;
AiCh = setTerminationAiCh(handles);
[AoCh, Value] = setTerminationAoCh(handles);
[Data, Time] = yfNiDaqAiAoB(AiCh, AoCh, AoWaveform, rate);
plot(handles.axes1, Time, Data);
assignin('base', handles.edit3.String, Data);
assignin('base', handles.edit4.String, Time);

function callback_yfNiDaqAiAoF(handles)
%
% Cellfunc = cellstr(handles.popupmenu10.String);
% StrFunc = Cellfunc{handles.popupmenu10.Value};
rate = str2double(handles.edit1.String);
AoWaveform = handles.axes2.Children.YData;
AiCh = setTerminationAiCh(handles);
[AoCh, Value] = setTerminationAoCh(handles);
[Data, Time] = yfNiDaqAiAoF(AiCh, AoCh, AoWaveform, rate);
plot(handles.axes1, Time, Data);
assignin('base', handles.edit3.String, Data);
assignin('base', handles.edit4.String, Time);

function callback_yfNiDaqAiAoFTrig(handles)
AiCh = setTerminationAiCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
TriggerTimeout = str2double(handles.edit14.String);
[AoCh, Value] = setTerminationAoCh(handles);
[Data, Time] = yfNiDaqAiAoFTrig(AiCh, AoCh, AoWaveform, rate, TriggerTimeout);
plot(handles.axes1, Time, Data);
assignin('base', handles.edit3.String, Data);
assignin('base', handles.edit4.String, Time);

function callback_yfNiDaqAiB(handles)
AiCh = setTerminationAiCh(handles);
rate = str2double(handles.edit1.String);
duration = str2double(handles.edit11.String);
[Data, Time] = yfNiDaqAiB(AiCh, rate, duration);
plot(handles.axes1, Time, Data);
assignin('base', handles.edit3.String, Data);
assignin('base', handles.edit4.String, Time);

function callback_yfNiDaqAiF(handles)
AiCh = setTerminationAiCh(handles);
rate = str2double(handles.edit1.String);
duration = str2double(handles.edit11.String);
[Data, Time] = yfNiDaqAiF(AiCh, rate, duration);
plot(handles.axes1, Time, Data);
assignin('base', handles.edit3.String, Data);
assignin('base', handles.edit4.String, Time);

function callback_yfNiDaqAiFTrig(handles)
AiCh = setTerminationAiCh(handles);
rate = str2double(handles.edit1.String);
TriggerTimeout = str2double(handles.edit14.String);
duration = str2double(handles.edit11.String);
[Data, Time] = yfNiDaqAiFTrig(AiCh, rate, duration, TriggerTimeout);
plot(handles.axes1, Time, Data);
assignin('base', handles.edit3.String, Data);
assignin('base', handles.edit4.String, Time);

function callback_yfNiDaqAoB(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
yfNiDaqAoB(AoCh, AoWaveform, rate)

function callback_yfNiDaqAoBCont(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
timeout = str2double(handles.edit11.String);
yfNiDaqAoBCont(AoCh, AoWaveform, rate, timeout)

function callback_yfNiDaqAoBContTrig(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
timeout = str2double(handles.edit11.String);
TriggerTimeout = str2double(handles.edit14.String);
yfNiDaqAoBContTrig(AoCh, AoWaveform, rate, timeout, TriggerTimeout)

function callback_yfNiDaqAoBContDoConst(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
timeout = str2double(handles.edit11.String);
DoCh = '0:3';
dec = str2num(handles.edit12.String);
binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
Latency = str2double(handles.edit13.String);
yfNiDaqAoBContDoConst(AoCh, AoWaveform, rate, timeout, DoCh, binaryVector, Latency)

function callback_yfNiDaqAoBContDoConstTrig(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
timeout = str2double(handles.edit11.String);
TriggerTimeout = str2double(handles.edit14.String);
DoCh = '0:3';
dec = str2num(handles.edit12.String);
binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
Latency = str2double(handles.edit13.String);
yfNiDaqAoBContDoConstTrig(AoCh, AoWaveform, rate, timeout, TriggerTimeout, DoCh, binaryVector, Latency)

function callback_yfNiDaqAoF(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
yfNiDaqAoF(AoCh, AoWaveform, rate)

function callback_yfNiDaqAoFTrig(handles)
[AoCh, Value] = setTerminationAoCh(handles);
AoWaveform = handles.axes2.Children.YData;
rate = str2double(handles.edit1.String);
TriggerTimeout = str2double(handles.edit14.String);
yfNiDaqAoFTrig(AoCh, AoWaveform, rate, TriggerTimeout)

function callback_yfNiDaqAoSS(handles)
%
% Cellfunc = cellstr(handles.popupmenu10.String);
% StrFunc = Cellfunc{handles.popupmenu10.Value};
[AoCh, Value] = setTerminationAoCh(handles);
yfNiDaqAoSS(AoCh, Value)

function callback_yfNiDaqDo(handles)
DoCh = '0:3';
dec = str2num(handles.edit12.String);
binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
yfNiDaqDo(DoCh, binaryVector)

function callback_yfNiDaqLoadLog(handles)
AiCh = setTerminationAiCh(handles);
yfNiDaqLoadLog(AiCh)

function [AiCh] = setTerminationAiCh(handles)
AiChc = [];
AiCht = [];
for i = 1:8
    tag1 = ['checkbox' num2str(i)];
    if(eval(['handles.' tag1 '.Value']))
        AiChc = [AiChc (i-1)];
        tag2 = ['popupmenu' num2str(i)];
        terminationvalue = eval(['handles.' tag2 '.Value;']);
        AiCht = [AiCht terminationvalue];
    end
    AiCh = [AiChc; AiCht];
end

function [AoCh, Value] = setTerminationAoCh(handles)
AoCh = [];
Value = [];
for i = 9:10
    tag1 = ['checkbox' num2str(i)];
    if(eval(['handles.' tag1 '.Value']))
        AoCh = [AoCh (i-9)];
        tag2 = ['edit' num2str(i-2)];
        v = eval(['str2double(handles.' tag2 '.String)']);
        Value = [Value v];
    end
end
% disp(AoCh)
% disp(Value)


% --------------------------------------------------------------------
function Menu1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Context1_Callback(hObject, eventdata, handles)
% hObject    handle to Context1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s.basestr = handles.edit2.String;
s.peri = handles.edit9.String;
assignin('base', [s.basestr '_' s.peri], s)

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Str = [handles.edit2.String '.mat'];
Expr = ['save(''' Str ''')'];
evalin('base', Expr);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
who

% --- Executes on key press with focus on edit10 and none of its controls.
function edit10_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(eventdata.Key, 'return'))
    StimWave = eval(hObject.String);
    Time = linspace(0, length(StimWave), length(StimWave))/str2num(handles.edit1.String);
    plot(handles.axes2, Time, StimWave);
end

% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_popupmenu(hObject)
Contents = cellstr(get(hObject,'String'));
Expression = Contents{get(hObject,'Value')};
if(~strcmp(Expression, 'no var'))
    StimWave = evalin('base', Expression);
    Time = linspace(0, length(StimWave), length(StimWave))/str2num(handles.edit1.String);
    plot(handles.axes2, Time,StimWave);
end

function update_popupmenu(src,~)
vars = evalin('base','who');
if(isempty(vars))
    vars = 'no var';
end
src.String = vars;

% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
update_popupmenu(hObject)

% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bit0 = get(handles.checkbox11, 'Value');
bit1 = get(handles.checkbox12, 'Value');
bit2 = get(handles.checkbox13, 'Value');
bit3 = get(handles.checkbox14, 'Value');
dec = binaryVectorToDecimal([bit0 bit1 bit2 bit3], 'LSBFirst');
set(handles.edit12, 'String', num2str(dec));

% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bit0 = get(handles.checkbox11, 'Value');
bit1 = get(handles.checkbox12, 'Value');
bit2 = get(handles.checkbox13, 'Value');
bit3 = get(handles.checkbox14, 'Value');
dec = binaryVectorToDecimal([bit0 bit1 bit2 bit3], 'LSBFirst');
set(handles.edit12, 'String', num2str(dec));

% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bit0 = get(handles.checkbox11, 'Value');
bit1 = get(handles.checkbox12, 'Value');
bit2 = get(handles.checkbox13, 'Value');
bit3 = get(handles.checkbox14, 'Value');
dec = binaryVectorToDecimal([bit0 bit1 bit2 bit3], 'LSBFirst');
set(handles.edit12, 'String', num2str(dec));

% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bit0 = get(handles.checkbox11, 'Value');
bit1 = get(handles.checkbox12, 'Value');
bit2 = get(handles.checkbox13, 'Value');
bit3 = get(handles.checkbox14, 'Value');
dec = binaryVectorToDecimal([bit0 bit1 bit2 bit3], 'LSBFirst');
set(handles.edit12, 'String', num2str(dec));

function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dec = str2double(get(hObject,'String'));
if(dec >= 0 && dec < 16)
    dec = floor(dec);
    bivec = decimalToBinaryVector(dec, 4, 'LSBFirst');
    set(handles.checkbox11, 'Value', bivec(1));
    set(handles.checkbox12, 'Value', bivec(2));
    set(handles.checkbox13, 'Value', bivec(3));
    set(handles.checkbox14, 'Value', bivec(4));
end

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
