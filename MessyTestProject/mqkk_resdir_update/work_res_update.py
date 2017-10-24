#!/usr/bin/env python3
#coding:utf-8

import os

file_dir = os.path.dirname(__file__) + '/'

shellPath = 'work_res_update.sh'

paramsList = {
    # '/Users/moqikaka/Work/xueyinglingzhu':['master', 'bt_master', 'stable'],
    '/Users/moqikaka/Work/xueyinglingzhu':['master'],
    # '/Users/moqikaka/Work/xianjing':['master'],
    # '/Users/moqikaka/Work/SNH':['master'],
    # '/Users/moqikaka/Work/huanzhu':['master', 'stable']
}

decollator_dir = '.'
decollator_branch = ','

def packStr(cmdList):
    listStr = ''
    for index, item in cmdList.items():
        listStr = listStr + decollator_dir + index + decollator_branch
        for value in item:
            listStr = listStr + value + decollator_branch
    return listStr     

#添加命令模式todo

cmd  = ' ' + packStr(paramsList) + ' ' + decollator_dir + ' ' + decollator_branch
cmd  = ' ' + packStr(paramsList) + ' ' + decollator_dir + ' ' + decollator_branch
os.system(file_dir + shellPath + cmd)
