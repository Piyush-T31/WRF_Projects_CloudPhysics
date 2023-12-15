;FILES = systemfunc (" ls -1 " + "grand_daily/201806/Week2/wrfout_d02* ")  ; The WRF ARW input file.
;a = addfiles(FILES+".nc","r")
a = addfiles("wrfout1_28_d01_2018-08-15_00:00:00.nc","r")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;i  = 62 ;SI
;j  = 51
;i = 93 ;SI d04
;j = 88
;i = 144; Hibernia
;j = 87

i = 1
j = 1
eta = 0

;i = 143; Hibernia z = 70.1m
;j = 86

;i = 141; Hebron z = 68.9m
;j = 90

lat = 46.750433
lon = -48.782933 ; Hibernia

;lat = 46.543889 ; Hebron
;lon = -48.489722
opt = True
;b = wrf_user_ll_to_xy(a,lon,lat,opt) 
;print(b)

;b = wrf_user_xy_to_ll(a,j,i,True)
;print(b)
timestep = -1
times = wrf_user_getvar(a,"times",-1)
;print(times)
;ntimes = dimsizes(times)

z = wrf_user_getvar(a,"height",0)
;print(z(:,0,0)) 

;lw = wrf_user_getvar(a,"LWDNFLX",24)
;print(lw(:,0,0))

qc   = wrf_user_getvar(a,"QCLOUD",96)
qc   = qc*1000.
qc@units = "g/kg"
print(qc(:,j,i))

;qr   = wrf_user_getvar(a,"QRAIN",120)
;qr   = qrain*1000.
;qr@units = "g/kg"
;print(qr(:,j,i))

;QN = wrf_user_getvar(a,"QNCLOUD",1)
;print(QN(:,j,i))

;QNWFA = wrf_user_getvar(a,"QNWFA",24)
;print(QNWFA(:,j,i))

;p = wrf_user_getvar(a,"slp",-1)
;print(p(:,j,i))

;T = wrf_user_getvar(a,"tk",120)
;print(T(:,0,0))

;T = T - 273.15
;Td = wrf_user_getvar(a,"td2",-1)

;RH = wrf_user_getvar(a,"rh",120)
;RH = RH/100	
;print(RH(:,j,i))

;U = wrf_user_getvar(a,"ua",120)
;print(U(:,j,i))

;V = wrf_user_getvar(a,"va",120)
;print(V(:,j,i))

;spd = new(dimsizes(U(:,j,i)),float)
;dir = new(dimsizes(V(:,j,i)),float)
;do it = 0,dimsizes(spd)-1
;  u = U(it,j,i)
;  v = V(it,j,i)
;  spd(it) = wind_speed(u,v)
;  dir(it) = wind_direction(u,v,1)
;end do
;print(T(:,j,i))
;print(Td(:,j,i))
;print(RH(:,j,i))
;print(U(:,j,i))
;print(V(:,j,i))
;print(Td(timestep,:,j,i))
;print(spd)
;print(dir)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
