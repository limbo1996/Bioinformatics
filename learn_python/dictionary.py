# -*- coding: utf-8 -*-
"""
Created on Thu Aug  1 16:44:28 2019

@author: Limbo
"""

aline_0 = {'color':'green', 'points':5}
new_points = aline_0['points']
print('You just earned' + ' ' + str(new_points) + ' ' + 'points!')
#添加键值对
print(aline_0)
aline_0['x_position'] = 0
aline_0['y_position'] = 25
print(aline_0)
#创建空字典
aline_1 = {}
aline_1['color'] = 'green'
aline_1['points'] = 5
print(aline_1)
#修改字典中的值
alien_0 = {'color':'green'}
print("The alien is " + alien_0['color'] + '.')
alien_0['color'] = 'yellow'
print('The alien is ' + alien_0['color'] + '.')
#记录速度
alien_0 = {'x_position':0, 'y_position':25, 'speed':'medium'}
print('Original x_position: ' + str(alien_0['x_position']))
#向右移动
alien_0['speed'] = 'fast'
if alien_0['speed'] == 'slow':
    x_increment = 1
elif alien_0['speed'] == 'medium':
    x_increment = 2
elif alien_0['speed'] == 'fast':
    x_increment = 3
else:
    x_increment = 4
print(alien_0)
alien_0['x_position'] = alien_0['x_position'] + x_increment
print('Now x_position: ' + str(alien_0['x_position']))
print(str(alien_0['y_position']))
#删除键值对
alien_0 = {'color':'green', 'point':5}
print(alien_0)
del alien_0['point']
print(alien_0)


favorite_language = {
        'jen':'python',
        'sarah':'c'}
print(favorite_language)
print(favorite_language['sarah'])
print("Sarah's favorite language is " + favorite_language['sarah'].title() + '.')
#遍历
user_0 = {
        'usename':'limbo',
        'first':'enrico',
        'last':'feimi'
        }
for v in sorted(user_0.values()):
    print(v.title())
    
#随机自动生成嵌套
aliens = []
for alien_number in range(30):
    new_alien = {'color':'green', 'points':5, 'speed':'slow'}
    aliens.append(new_alien)
    
for alien in aliens[:5]:
    print(alien)
print("...")

for alien in aliens[0:3]:
    if alien['color'] == 'green':
        alien['color'] = 'yellow'
        alien['speed'] = 'medium'
        alien['points'] = 10
#字典中储存列表
pizza = {
        'crust':'thick',
        'toppings':['mushrooms', 'extra cheese'],
        }
print('You ordered a ' + pizza['crust'] + '-crust pizza' + 
      'with the following topping:')
for topping in pizza['toppings']:
    print("\t" + topping)

favorite_languages = {
        'jen':['python', 'ruby'],
        'sarah':['c'],
        'edward':['ruby', 'go'],
        'phil':['python', 'haskell'],
        }
for name, languages in favorite_languages.items():
    print("\n" + name.title() + "'s favorite language are: ")
    for language in languages:
        print("\t" + language.title())





































############################################################
a=open('A.txt')
b=open('B.txt')
row=0
for linea,lineb in zip(a,b):  
    row+=1
    if not linea==lineb:  
        col=0
        for chara,charb in zip(linea,lineb): 
            col+=1
            if not chara==charb:
                print("difference in row:%d col:%d"%(row,col))
                break




























