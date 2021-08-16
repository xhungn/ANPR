function varargout = anprGUI(varargin)

% Hung Nguyen
% Image Engineering Final Presentation
% anprGUI.m

% ANPRGUI MATLAB code for anprGUI.fig
%      ANPRGUI, by itself, creates a new ANPRGUI or raises the existing
%      singleton*.
%
%      H = ANPRGUI returns the handle to a new ANPRGUI or the handle to
%      the existing singleton*.
%
%      ANPRGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANPRGUI.M with the given input arguments.
%
%      ANPRGUI('Property','Value',...) creates a new ANPRGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before anprGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to anprGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help anprGUI

% Last Modified by GUIDE v2.5 27-Jul-2021 14:38:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @anprGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @anprGUI_OutputFcn, ...
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


% --- Executes just before anprGUI is made visible.
function anprGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to anprGUI (see VARARGIN)

% Choose default command line output for anprGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes anprGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = anprGUI_OutputFcn(hObject, eventdata, handles) 
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
[filename, filepath] = uigetfile({'*.*';'*.jpg';'*.png';'*.bmp'},'Search image to be displayed');
fullname = [filepath filename];
im = imread(fullname);

[im,h] = step1(im);
figure
plateNumber = step2and3(im,h)