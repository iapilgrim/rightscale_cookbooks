#
# Cookbook Name:: helloworld
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
rightscale_marker

  first_name = node[:helloworld][:first_name]
  food = node[:helloworld][:favorite][:food]
  drink = node[:helloworld][:favorite][:drink]
  hobby = node[:helloworld][:favorite][:hobby]
  
  log "Hi, my name is #{first_name} and I like #{food}, #{drink} and #{hobby}."