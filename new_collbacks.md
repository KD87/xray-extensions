|Код|Краткое описание|Версия<br>игры<table><thead><th>Для какого объекта<br>вызывается</th><th>Передаваемые аргументы</th><th>Комментарии</th></thead><tbody>
<tr><td>callback.hit</td><td>Хит ГГ          </td><td>ТЧ/ЧН/ЗП      </td><td>CActor                          </td><td>obj, amount, local_direction, who, bone_index</td><td>Стандартный хит-колбек</td></tr>
<tr><td>callback.hit</td><td>Хит прожектора  </td><td>ТЧ            </td><td>CProjector                      </td><td>obj, amount, local_direction, who, bone_index</td><td>Стандартный хит-колбек</td></tr>
<tr><td>callback.death</td><td>Уничтожение машины</td><td>ТЧ            </td><td>CCar                            </td><td>нет                   </td><td>Вызывается при взрыве машины</td></tr>
<tr><td>123</td><td><b>Нажатие клавиши</b></td><td><b>ТЧ/ЧН/ЗП</b></td><td><b>CActor</b>                   </td><td><b>dik</b>            </td><td><b>Возвращает код клавиши из таблицы DIK_keys</b></td></tr>
<tr><td>124</td><td><b>Отпускание клавиши</b></td><td><b>ТЧ/ЧН</b>  </td><td><b>CActor</b>                   </td><td><b>dik</b>            </td><td><b>Возвращает код клавиши из таблицы DIK_keys</b></td></tr>
<tr><td>125</td><td><b>Удержание клавиши</b></td><td><b>ТЧ/ЧН</b>  </td><td><b>CActor</b>                   </td><td><b>dik</b>            </td><td><b>Возвращает код клавиши из таблицы DIK_keys</b></td></tr>
<tr><td>126</td><td><b>Вращение колеса мыши</b></td><td><b>ТЧ/ЧН</b>  </td><td><b>CActor</b>                   </td><td><b>vol</b>            </td><td><b>Скорость вращения + 100000</b></td></tr>
<tr><td>127</td><td><b>Движение мыши</b></td><td><b>ТЧ/ЧН</b>  </td><td><b>CActor</b>                   </td><td><b>x, y</b>           </td><td><b>Смещения с последнего перемещения, скорость + 100000</b></td></tr>
<tr><td>128</td><td><b>Хит аномалией объекта</b></td><td><b>ТЧ</b>     </td><td><b>CCustomZone</b>              </td><td><b>obj</b>            </td><td>Для неживых объектов вызывается только при попадании, для живых ещё и при нахождении в аномалии</td></tr>
<tr><td>129</td><td><b>Выкидывание предмета из инвентаря</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td><b>Работает только в окне инвентаря по контекстному меню или клавише G</b></td></tr>
<tr><td>130</td><td><b>Помещение предмета</b><br>на пояс</td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td>           </td></tr>
<tr><td>131</td><td><b>Помещение предмета</b><br>в рюкзак</td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td>           </td></tr>
<tr><td>132</td><td><b>Помещение предмета</b><br>в слот</td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td>           </td></tr>
<tr><td>133</td><td><b>Выделение предмета</b><br>в инвентаре</td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td><b>Работает во всех окнах</b></td></tr>
<tr><td>134</td><td><b>Переключение состояния фонарика</b></td><td><b>ТЧ</b>     </td><td><b>CTorch</b>                   </td><td><b>state</b>          </td><td><b>state: 0 - off, 1 - on</b></td></tr>
<tr><td>135</td><td><b>А хз как назвать :)</b></td><td><b>ТЧ</b>     </td><td><b>CAI_Stalker</b>              </td><td><b>lvid</b>           </td><td><b>Вызывается после вызова метода set_dest_level_vertex_id для сталкеров, передается левел вертекс</b></td></tr>
<tr><td>136</td><td><b>Создание иконки</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td><b>Вызывается при заполнении иконками окна инвентаря</b></td></tr>
<tr><td>137</td><td><b>Посадка в машину</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>car</b>            </td><td>           </td></tr>
<tr><td>138</td><td><b>Использование машины</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>car</b>            </td><td><b>Вызывается при попытке заюзать машину (но не при посадке\высадке)</b></td></tr>
<tr><td>139</td><td><b>Высадка из машины</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>car</b>            </td><td>           </td></tr>
<tr><td>140</td><td><b>Событие после сейва</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>нет</b>            </td><td><b>Вызывается сразу после сохранения игры</b></td></tr>
<tr><td>141</td><td><b>Наведение мыши на иконку</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td><b>Вызывается при наведении мыши на иконку в инвентаре</b></td></tr>
<tr><td>142</td><td><b>Убирание мыши с иконки</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td><b>Вызывается при убирании мыши с иконки в инвентаре</b></td></tr>
<tr><td>143</td><td><b>Группировка предмета</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>obj</b>            </td><td><b>Вызывается в функции сравнения объектов для группировки в инвентаре</b></td></tr>
<tr><td>144</td><td><b>Хит ГГ от монстра или НПС</b></td><td><b>ТЧ</b>     </td><td><b>CActor</b>                   </td><td><b>mob_type, side</b> </td><td><b>mob_type: 0 - stalker, 1 - monster; side: сторона откуда был нанесен хит</b></td></tr>
<tr><td>151</td><td>Помещение предмета в ящик</td><td>ТЧ            </td><td>CInventoryBox                   </td><td>obj                   </td><td>Работает только с ящиками (с трупами не работает)</td></tr>
<tr><td>152</td><td>Начало обработки хита</td><td>ТЧ            </td><td>CEntityAlive                    </td><td>p_hit_params - указатель на структуру с параметрами хита<br>p_igore_flags - указатель на флаги возврата</td><td>Позволяет модифицировать параметры хита перед их воздействием на объект</td></tr>
<tr><td>153</td><td>Хит от НПС      </td><td>ТЧ            </td><td>CEntityAlive                    </td><td>who                   </td><td><b>Передается вредитель</b></td></tr>
<tr><td>154</td><td>Обновление видимости аддонов мировой модели оружия</td><td>ТЧ            </td><td>объект оружия                   </td><td>нет                   </td><td>           </td></tr>
<tr><td>155</td><td>Обновление видимости аддонов худа оружия</td><td>ТЧ            </td><td>объект оружия                   </td><td>нет                   </td><td>           </td></tr>
<tr><td>156</td><td>Событие перед использованием предмета</td><td>ТЧ            </td><td>CActor                          </td><td>obj                   </td><td>Позволяет менять свойства предмета и таким образом реализовать иммунитеты</td></tr>
<tr><td>180</td><td>Выбор контакта в ПДА</td><td>ТЧ            </td><td>CActor                          </td><td>id                    </td><td>Работает только во вкладке "Контакты"</td></tr></tbody></table>

Примечание: рекомендуется завести таблицу Lua с константами для кодов введённый колбеков. Поместите этот код в модуль <i>g.script.<br></i><pre><code>callback_ex = {<br>
["on_key_press"]                 = 123,<br>
["on_key_release"]               = 124,<br>
["on_key_hold"]                  = 125,<br>
["on_mouse_wheel"]               = 126,<br>
["on_mouse_move"]                = 127,<br>
["on_anomaly_hit"]               = 128,<br>
["on_belt"]                      = 130,<br>
["on_ruck"]                      = 131,<br>
["on_slot"]                      = 132,<br>
["on_select_item"]               = 133,<br>
["on_switch_torch"]              = 134,<br>
["on_inv_box_put_item"]          = 151,<br>
["entity_alive_before_hit"]      = 152,<br>
["update_addons_visibility"]     = 154,<br>
["update_hud_addons_visibility"] = 155,<br>
["on_before_use_item"]           = 156;<br>
["pda_contact"]                  = 180,<br>
}</code></pre>

и используйте в таком стиле:<br>
<pre><code>function actor_binder:reinit()<br>
...<br>
self.object:set_callback(callback_ex.on_key_press, self.on_key, self)			-- нажатие клавиши<br>
...<br>
end</code></pre>