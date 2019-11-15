package com.edo.controller;

        import com.edo.pojo.EdocCategory;
        import com.edo.pojo.EdocEntry;
        import com.edo.service.EdocCategoryService;
        import com.edo.service.EdocEntryService;
        import org.springframework.beans.propertyeditors.CustomDateEditor;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.WebDataBinder;
        import org.springframework.web.bind.annotation.*;

        import javax.annotation.Resource;
        import java.text.ParseException;
        import java.text.SimpleDateFormat;
        import java.util.Date;
        import java.util.List;

@Controller
@RequestMapping("/edoc")
public class EdocController {
    @Resource
    private EdocEntryService edocEntryService;
    @Resource
    private EdocCategoryService edocCategoryService;

    @RequestMapping(value = "index.html")
    public String getList(@RequestParam(value = "categoryId",required = false)String categoryId,
                          Model model
    ){
        List<EdocCategory> categoryList=edocCategoryService.getlist();
        List<EdocEntry>  entryList = edocEntryService.getlist(categoryId);
        model.addAttribute("entryList",entryList);

        model.addAttribute("categoryList",categoryList);
        model.addAttribute("categoryId",categoryId);
        return "index";
    }

    /**
     * 添加
     * @return
     */
    @RequestMapping(value = "add.html",method = RequestMethod.GET)
    public String getAdd(Model model){
        List<EdocCategory> categoryList=edocCategoryService.getlist();
        model.addAttribute("categoryList",categoryList);
        return "add";
    }
    @RequestMapping(value = "addlist.html",method = RequestMethod.POST)
    public String getAddlist(Model model,EdocEntry edocEntry){

        if (edocEntryService.getAdd(edocEntry)){
            model.addAttribute("edocEntry",edocEntry);
            return "redirect:/edoc/index.html";
        }
        return "add";
    }

    /**
     * @initBinder注解的方法会在控制器初始化时调用
     * 在initBinder方法体内通过registerCustomEditor()方法注册一个自定义编辑器
     * 第一个参数表示编辑器类型为日期类型，第二个参数表示使用自定义编辑器CoustomDateEditor，格式为yyyy-MM-dd，第三个参数表示该参数允许为空
     *
     */
    @InitBinder
    public void initBinder(WebDataBinder dataBinder){
        dataBinder.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
    }

    /**
     * 修改
     */
    @RequestMapping(value = "update.html",method = RequestMethod.GET)
    public String getUpadte(String id ,Model model){
        EdocEntry edocEntry=edocEntryService.getById(id);
        model.addAttribute("id",id);
        List<EdocCategory> categoryList=edocCategoryService.getlist();
        model.addAttribute("edocEntry",edocEntry);
        model.addAttribute("categoryList",categoryList);
        return "update";
    }

    @RequestMapping(value = "updatelist.html",method = RequestMethod.POST)
    public String getUpdateList(EdocEntry edocEntry,String createdate11){
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date=null;

        try {
            date = formatter.parse(createdate11);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        edocEntry.setCreatedate(date);
        if (edocEntryService.getUpdate(edocEntry)) {
            return "redirect:/edoc/index.html";
        }
        return "update";
    }
    /**\
     * 删除
     */
    @RequestMapping(value = "/del.html")
    public Object getDel(@RequestParam(value = "id",required = false)Integer id,Model model){
        boolean falg=edocEntryService.getDel(id);
        if (falg){
            List<EdocCategory> categoryList=edocCategoryService.getlist();
            List<EdocEntry>  entryList = edocEntryService.getlist("");
            model.addAttribute("entryList",entryList);

            model.addAttribute("categoryList",categoryList);
            model.addAttribute("result",new Boolean(true));
           return "index";
        }else {
            return "redirect:/edoc/index.html";
        }
    }

}
