package com.ubivelox.tlv;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ubivelox.gaia.GaiaException;

import exception.UbiveloxException;
import tlvparser.TLVParser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController
{

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);





    /**
     * Simply selects the home view to render by returning its name.
     *
     * @throws GaiaException
     * @throws UbiveloxException
     */
    @RequestMapping(value = "/",
                    method = RequestMethod.GET)
    public ModelAndView home(final Locale locale, final ModelAndView mav, final HttpServletRequest request) throws UbiveloxException, GaiaException
    {

        mav.setViewName("home");
        final String text = request.getParameter("text");

        System.out.println(text);

        try
        {
            final String result = TLVParser.parse(text);

            mav.addObject(result);

        }
        catch ( final Exception e )
        {
            // TODO: handle exception
        }

        return mav;
    }

}
