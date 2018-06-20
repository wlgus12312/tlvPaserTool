package com.ubivelox.tlv;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ubivelox.gaia.GaiaException;
import com.ubivelox.gaia.util.GaiaUtils;

import exception.UbiveloxException;
import tlvparser.TLVObject;
import tlvparser.TLVParser;
import tlvparser.TLVParserWithArrayList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ParserController
{

    private static final Logger logger = LoggerFactory.getLogger(ParserController.class);





    /**
     * Simply selects the home view to render by returning its name.
     *
     * @throws GaiaException
     * @throws UbiveloxException
     */
    @RequestMapping(value = "/parser.pa",
                    method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, ArrayList<TLVObject>> home(final Locale locale, final ModelAndView mav, final HttpServletRequest request) throws UbiveloxException, GaiaException
    {

        // mav.setViewName("home");

        final HashMap<String, ArrayList<TLVObject>> map = new HashMap<String, ArrayList<TLVObject>>();

        final String text = request.getParameter("hex");

        final String result = TLVParser.parse(text);
        final ArrayList<TLVObject> list = TLVParserWithArrayList.parse1(text, GaiaUtils.convertHexaStringToByteArray(text), 0, -1);

        map.put("result", list);

        // mav.addObject("result", result);

        return map;
    }

}
