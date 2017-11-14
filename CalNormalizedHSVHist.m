function [ Hist ] = CalNormalizedHSVHist( Im, HbinNum, SbinNum, VbinNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Hist = zeros(1, HbinNum*SbinNum*VbinNum);

A = rgb2hsv(Im);

H = A(:,:,1);
S = A(:,:,2);
V = A(:,:,3);




end

