;ARW coordinate dynamics option.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/time_axis_labels.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"

begin

; We generate plots, but what kind do we prefer?
; type = "x11"
 type = "png"
; type = "pdf"
; type = "ps"
; type = "ncgm"
  wks = gsn_open_wks(type,"polrossSection_1")

  gsn_define_colormap(wks,"WhBlGrYeRe")   ; overwrite the .hluresfile color map

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
function add_right_title(wks,plot,title)
local txres, font_height, txid, amres
begin
;---Retrieve font height of left axis string.
  getvalues plot
    "tiXAxisFontHeightF" : font_height
  end getvalues

;---Create a right axis text string to add to plot.
  txres               = True
  txres@txAngleF      = 270.
  txres@txFontHeightF = font_height  ; Use same font height as left axis

  txid = gsn_create_text(wks,title,txres)


;---Move text string to center/right edge of plot.
  amres                  = True
  amres@amParallelPosF   = 0.7    ; 0.5 is the right edge of the plot, so
                                  ; 0.6 is a little further to the right.
  amres@amOrthogonalPosF = 0.0    ; This is the center of the plot.
  amres@amJust           = "CenterCenter"

  annoid = gsn_add_annotation(plot, txid, amres)  ; Attach string to plot
  return(annoid)
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Set some basic resources
  res = True

  mpres  = True  ; Map resources
  pltres = True ; Plot resources
;  i = 62 ;Sable
;  j = 51
;  i = 144 ;Hibernia
;  j = 87
;   i = 150
;   j = 74
  i = 1
  j = 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    a = addfile("wrfout1_28_28_d01_2018-08-15_00:00:00.nc","r")
;     a = addfile("../../../low_res/wrfout_d02_2018-08-15_12:00:00.nc","r")
    title = ""
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    qc = wrf_user_getvar(a,"QCLOUD",-1)
    qc = qc*1000.
    qc@units = "g/kg"
    qcs=transpose(qc(:,:,j,i))
    times = wrf_times_c(a->Times,0)
    z  = wrf_user_getvar(a,"z",-1)
    zp = z(0,:,j,i)
    Z  = round(zp,3)
    Eta = fspan(0,100,100)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      opts                      = res
      opts@gsnDraw              = False
      opts@gsnFrame             = False
      opts@cnFillOn             = True
      opts@gsnSpreadColors      = False
      opts@gsnMaximize          = True
      opts@gsnContourLineThicknessesScale = 0.5
      opts@cnLevelSelectionMode = "ManualLevels"
      opts@cnMinLevelValF       = 0.02
      opts@cnMaxLevelValF       = 0.22
      opts@cnLevelSpacingF      = 0.02
      opts@tmYUseLeft           = False
      opts@tmYRLabelsOn         = True
      opts@tmYROn               = True
      opts@tmYRMode             = "Explicit"
      opts@tmYRValues           = Eta
      opts@tmYRLabels           = Z
      opts@tmYRLabelStride      = 10
      opts@tmYRMajorThicknessF  = 0
      opts@tmYRMinorThicknessF  = 0
      opts@tiYAxisString        = "Grid Level"
      opts@gsnLeftString        = title
      restick                   = True
      restick@ttmFormat         = "%D %HZ"
      restick@ttmMajorStride    = 24
      time_axis_labels(times,opts,restick)

contour = gsn_csm_contour(wks,qcs,opts)
amid = add_right_title(wks,contour,"Height(m)")

psres = True
psres@gsnPaperOrientation = "Portrait"
maximize_output(wks,psres)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end
