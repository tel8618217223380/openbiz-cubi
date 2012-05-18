<?xml version="1.0" encoding="UTF-8"?>
<EasyForm Name="{$form_name}" 
			Class="{$form_class}" 
			FormType="Detail" 
			jsClass="Openbiz.Form" 
			Icon="{$form_icon}"
			Title="{$form_title}" 
			Description="{$form_description}" 
			BizDataObj="{$form_do}" 
			TemplateEngine="Smarty" 
			TemplateFile="{$form_template}" 
			MessageFile="{$message_file}" 
			Access="{$acl.access}">
    <DataPanel>
{foreach from=$fields item=fld}
{if $fld.Field != 'Id' && 
	$fld.Field != 'id' && 
	$fld.Field != 'create_by' && 
	$fld.Field != 'create_time' && 
	$fld.Field != 'update_by' && 
	$fld.Field != 'update_time' && 
	$fld.Field != 'other_perm' && 
	$fld.Field != 'group_perm' &&
	$fld.Field != 'group_id' &&
	$fld.Field != 'owner_id' &&
	$fld.Field != 'sortorder' &&
	$fld.Field != 'sort_order' 
	}
       	<Element Name="fld_{$fld.Field}" 
       				ElementSet="General" 
       				Class="LabelText" 
       				FieldName="{$fld.Field}" 
       				Label="{$fld.FieldLabel}" 
       				AllowURLParam="{if $fld.Field eq 'Id'}Y{else}N{/if}"/>
       				
{elseif $fld.Field == 'create_by' || 
		$fld.Field == 'update_by'}
       	<Element Name="fld_{$fld.Field}" 
       				Class="LabelText" 
       				ElementSet="Miscellaneous" 
       				FieldName="{$fld.Field}" 
       				Label="{$fld.FieldLabel}" 
       				Text="{literal}{{/literal}BizSystem::GetProfileName(@:Elem[fld_{$fld.Field}].Value){literal}}{/literal}" 
       				AllowURLParam="N"/>    
       				   	
{elseif $fld.Field == 'create_time' || 
		$fld.Field == 'update_time' ||
		$fld.Field == 'sortorder' ||
		$fld.Field == 'sort_order'  
		}
       	<Element Name="fld_{$fld.Field}" 
       				Class="LabelText" 
       				ElementSet="Miscellaneous" 
       				FieldName="{$fld.Field}" 
       				Label="{$fld.FieldLabel}"  
       				AllowURLParam="N"/>       	
       				
{elseif $fld.Field != 'other_perm' && 
		$fld.Field != 'group_perm' &&
		$fld.Field != 'group_id' &&
		$fld.Field != 'owner_id' &&
		$fld.Field != 'id' &&
		$fld.Field != 'type_id' 
		}		
		<Element Name="fld_{$fld.Field}" 
					ElementSet="General" 
					Hidden="Y" 
					Class="LabelText" 
					FieldName="{$fld.Field}" 
					Label="{$fld.FieldLabel}" 
					AllowURLParam="{if $fld.Field eq 'Id'}Y{else}N{/if}"/>
					
{/if}
{/foreach}
    </DataPanel>
    <ActionPanel>       
        <Element Name="btn_new" 
        			Class="Button" 
        			Text="Add" 
        			CssClass="button_gray_add" 
        			Description="New record (Insert)">
			<EventHandler Name="btn_new_onclick" 
							Event="onclick" 
							Function="SwitchForm({$comp}.{$new_form})"  
							ShortcutKey="Insert" 
							ContextMenu="New" />
        </Element>          
        <Element Name="btn_edit" 
        			Class="Button" 
        			Text="Edit" 
        			CssClass="button_gray_m" 
        			Description="Edit record (Ctrl+E)">
			<EventHandler Name="btn_new_onclick" 
							Event="onclick" 
							Function="SwitchForm({$comp}.{$edit_form},{literal}{@:Elem[fld_Id].Value}{/literal})"  
							ShortcutKey="Ctrl+E" 
							ContextMenu="Edit" />
        </Element>
		<Element Name="btn_copy" 
					Class="Button" 
					Text="Copy" 
					CssClass="button_gray_m" 
					Description="Copy record (Ctrl+C)">
            <EventHandler Name="onclick" 
            				Event="onclick" 
            				EventLogMsg="" 
            				Function="CopyRecord({literal}{@:Elem[fld_Id].Value}{/literal})" 
            				RedirectPage="form={$comp}.{$copy_form}&amp;fld:Id={literal}{@:Elem[fld_Id].Value}{/literal}" 
            				ShortcutKey="Ctrl+C" 
            				ContextMenu="Copy"/>
        </Element> 
        <Element Name="btn_delete" 
        			Class="Button" 
        			Text="Delete" 
        			CssClass="button_gray_m" 
        			Description="Delete record (Delete)">
            <EventHandler Name="del_onclick" 
            				Event="onclick" 
            				EventLogMsg="" 
            				Function="DeleteRecord({literal}{@:Elem[fld_Id].Value}{/literal})"  
            				RedirectPage="form={$comp}.{$list_form}" 
            				ShortcutKey="Ctrl+Delete" 
            				ContextMenu="Delete" />
        </Element>
        <Element Name="btn_cancel" 
        			Class="Button" 
        			Text="Back" 
        			CssClass="button_gray_m">
            <EventHandler Name="btn_cancel_onclick" 
            				Event="onclick" 
            				Function="SwitchForm()"  
            				ShortcutKey="Escape" 
            				ContextMenu="Cancel" />
        </Element>         
    </ActionPanel> 
    <NavPanel>
    </NavPanel> 
    <SearchPanel>
    </SearchPanel>
</EasyForm>