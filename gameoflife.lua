
linea={0,0,0,0,0,0,0,0,0,0}
lineb={0,0,0,0,0,0,0,0,0,0}
linec={0,0,0,0,0,0,0,0,0,0}
lined={0,0,0,0,0,0,0,0,0,0}
linee={0,0,0,0,0,0,0,0,0,0} -- 0 = dead cell
linef={0,0,0,0,0,0,0,0,0,0} -- 1 = alive cell
lineg={0,0,0,0,0,0,0,0,0,0} -- 2 = to become alive in next generation
lineh={0,0,0,0,0,0,0,0,0,0} -- 3 = to be killed in the next generation
linei={0,0,0,0,0,0,0,0,0,0}
linej={0,0,0,0,0,0,0,0,0,0}


nlinea={0,0,0,0,0,0,0,0,0,0}
nlineb={0,0,0,0,0,0,0,0,0,0}
nlinec={0,0,0,1,0,0,0,0,0,0}
nlined={0,0,0,0,1,1,0,0,0,0}
nlinee={0,0,0,1,1,0,0,0,0,0} -- 0 = dead cell
nlinef={0,0,0,0,0,0,0,0,0,0} -- 1 = alive cell
nlineg={0,0,0,0,0,0,0,0,0,0} -- 2 = to become alive in next generation
nlineh={0,0,0,0,0,0,0,0,0,0} -- 3 = to be killed in the next generation
nlinei={0,0,0,0,0,0,0,0,0,0}
nlinej={0,0,0,0,0,0,0,0,0,0}

pnlinea={0,0,0,0,0,0,0,0,0,0}
pnlineb={0,0,0,0,0,0,0,0,0,0}
pnlinec={0,0,0,0,0,0,0,0,0,0}
pnlined={0,0,0,0,0,0,0,0,0,0}
pnlinee={0,0,0,0,0,0,0,0,0,0} -- 0 = dead cell
pnlinef={0,0,0,0,0,0,0,0,0,0} -- 1 = alive cell
pnlineg={0,0,0,0,0,0,0,0,0,0} -- 2 = to become alive in next generation
pnlineh={0,0,0,0,0,0,0,0,0,0} -- 3 = to be killed in the next generation
pnlinei={0,0,0,0,0,0,0,0,0,0}
pnlinej={0,0,0,0,0,0,0,0,0,0}

line1={1,nlinea}
line2={2,nlineb}
line3={3,nlinec}
line4={4,nlined}
line5={5,nlinee}
line6={6,nlinef}
line7={7,nlineg}
line8={8,nlineh}
line9={9,nlinei}
line10={10,nlinej}






function converter (n)
  if n == 1 then
    return pnlinea
  elseif n==2 then
    return pnlineb
  elseif n==3 then
    return pnlinec
  elseif n==4 then
    return pnlined
  elseif n==5 then
    return pnlinee
  elseif n==6 then
    return pnlinef
  elseif n==7 then
    return pnlineg
  elseif n==8 then
    return pnlineh
  elseif n==9 then
    return pnlinei
  elseif n==10 then
    return pnlinej
  end
end

function convert (n)
  if n == 1 then
    return nlinea
  elseif n==2 then
    return nlineb
  elseif n==3 then
    return nlinec
  elseif n==4 then
    return nlined
  elseif n==5 then
    return nlinee
  elseif n==6 then
    return nlinef
  elseif n==7 then
    return nlineg
  elseif n==8 then
    return nlineh
  elseif n==9 then
    return nlinei
  elseif n==10 then
    return nlinej
  end
end



function check (line,lnum)
  sur = 0
  local lnc = 0
  upperl = 0
  lower1 = 0
  if line1[1] == line then
    lnc = nlinea
    upperl = {}
    lower1 = nlineb
  elseif line2[1] == line then
    lnc = nlineb
    upperl = nlinea
    lower1 = nlinec
  elseif line3[1] == line then
    lnc = nlinec
    upperl = nlineb
    lower1 = nlined
    
  elseif line4[1] == line then
    lnc = nlined
    upperl = nlinec
    lower1 = nlinee
  elseif line5[1] == line then
    lnc = nlinee
    upperl = nlined
    lower1 = nlinef
  elseif line6[1] == line then
    lnc = nlinef
    upperl = nlinee
    lower1 = nlineg
  elseif line7[1] == line then
    lnc = nlineg
    upperl = nlinef
    lower1 = nlineh
  elseif line8[1] == line then
    lnc = nlineh
    upperl = nlineg
    lower1 = nlinei
  elseif line9[1] == line then
    lnc = nlinei
    upperl = nlineh
    lower1 = nlinej
  elseif line10[1] == line then
    lnc = nlinej
    upperl = nlinei
    lower1 = {}
  end
  
  if lnc[(lnum-1)] == 1 then
    sur = sur + 1
    
  end
  if lnc[(lnum+1)] == 1 then
    sur = sur + 1
  end
  if upperl[(lnum-1)] == 1 then
    sur = sur + 1
  end
  if upperl[(lnum)] == 1 then
    sur = sur + 1
  end
  if upperl[(lnum+1)] == 1 then
    sur = sur + 1
  end
  if lower1[(lnum-1)] == 1 then
    sur = sur + 1
  end
  if lower1[(lnum)] == 1 then
    sur = sur + 1
  end
  if lower1[(lnum+1)] == 1 then
    sur = sur + 1
  
  end
  return sur
  
end



function generate ()
  ltc = 1
  lntc = 1
  cont = true
  sbhm = nil
  copy = convert(ltc)
  
  while cont == true
  do
    copy = convert(ltc)
    sbhm = check(ltc,lntc)
    if copy[lntc] ~= 0 then
      lntc = lntc + 1
      
    else
      if sbhm ~= 3 then
        lntc = lntc + 1
        
      else
        copy[lntc] = 2
        lntc = lntc + 1
        
      end
    end
    if lntc == 11 then
      
      if ltc == 1 then
        
        pnlinea = copy
      elseif ltc == 2 then
        
        pnlineb = copy
      elseif ltc == 3 then
        pnlinec = copy
      elseif ltc == 4 then
        pnlined = copy
      elseif ltc == 5 then
        pnlinee = copy
      elseif ltc == 6 then
        pnlinef = copy
      elseif ltc == 7 then
        pnlineg = copy
      elseif ltc == 8 then
        pnlineh = copy
      elseif ltc == 9 then
        pnlinei = copy
      elseif ltc == 10 then
        pnlinej = copy
      end
      lntc = 1
      ltc = ltc + 1
      if ltc == 11 then
        cont = false
      end
    end
  end
end
  
function kill ()
  ltc = 1
  lntc = 1
  cont = true
  sbhm = nil
  copy = convert(ltc)
  
  while cont == true
  do
    copy = convert(ltc)
    sbhm = check(ltc,lntc)
    if copy[lntc] ~= 1 then
      lntc = lntc + 1
      
    else
      if sbhm > 3 then
        copy[lntc] = 3
        lntc = lntc + 1
        
      else
      
        lntc = lntc + 1
        
      end
      if sbhm < 2 then
        copy[lntc] = 3
        lntc = lntc + 1
        
      else
        
        lntc = lntc + 1
        
      end
    end
    if lntc == 11 then
      
      if ltc == 1 then
        
        pnlinea = copy
      elseif ltc == 2 then
        
        pnlineb = copy
      elseif ltc == 3 then
        pnlinec = copy
      elseif ltc == 4 then
        pnlined = copy
      elseif ltc == 5 then
        pnlinee = copy
      elseif ltc == 6 then
        pnlinef = copy
      elseif ltc == 7 then
        pnlineg = copy
      elseif ltc == 8 then
        pnlineh = copy
      elseif ltc == 9 then
        pnlinei = copy
      elseif ltc == 10 then
        pnlinej = copy
      end
      lntc = 1
      ltc = ltc + 1
      if ltc == 11 then
        cont = false
      end
    end
  end
end
  
function round () -- 0 = dead cell
  ltc = 1
  lntc = 1
  cont = true
  
  copy = convert(ltc)
  
  while cont == true
  do
    copy = convert(ltc)
    if copy[lntc] == 1 then
      lntc = lntc + 1
    elseif copy[lntc] == 0 then
      lntc = lntc + 1
    elseif copy[lntc] == 2 then
      copy[lntc] = 1
      lntc = lntc + 1
    elseif copy[lntc] == 3 then
      copy[lntc] = 0
      lntc = lntc + 1
    end
    if lntc == 11 then
      
      if ltc == 1 then
        
        pnlinea = copy
      elseif ltc == 2 then
        
        pnlineb = copy
      elseif ltc == 3 then
        pnlinec = copy
      elseif ltc == 4 then
        pnlined = copy
      elseif ltc == 5 then
        pnlinee = copy
      elseif ltc == 6 then
        pnlinef = copy
      elseif ltc == 7 then
        pnlineg = copy
      elseif ltc == 8 then
        pnlineh = copy
      elseif ltc == 9 then
        pnlinei = copy
      elseif ltc == 10 then
        pnlinej = copy
      end
      lntc = 1
      ltc = ltc + 1
      if ltc == 11 then
        cont = false
      end
    end
  end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
function compacter ()
  generate()
  kill()
  round()
  nlinea = pnlinea
  nlineb = pnlineb
  nlinec = pnlinec
  nlined = pnlined
  nlinee = pnlinee
  nlinef = pnlinef
  nlineg = pnlineg
  nlineh = pnlineh
  nlinei = pnlinei
  nlinej = pnlinej
  linea = nlinea
  lineb = nlineb
  linec = nlinec
  lined = nlined
  linee = nlinee
  linef = nlinef
  lineg = nlineg
  lineh = nlineh
  linei = nlinei
  linej = nlinej
  pnlinea = {0,0,0,0,0,0,0,0,0,0}
  pnlineb = {0,0,0,0,0,0,0,0,0,0}
  pnlinec = {0,0,0,0,0,0,0,0,0,0}
  pnlined = {0,0,0,0,0,0,0,0,0,0}
  pnlinee = {0,0,0,0,0,0,0,0,0,0}
  pnlinef = {0,0,0,0,0,0,0,0,0,0}
  pnlineg = {0,0,0,0,0,0,0,0,0,0}
  pnlineh = {0,0,0,0,0,0,0,0,0,0}
  pnlinei = {0,0,0,0,0,0,0,0,0,0}
  pnlinej = {0,0,0,0,0,0,0,0,0,0}
end

function printt ()
  io.write(linea[1],linea[2],linea[3],linea[4],linea[5],linea[6],linea[7],linea[8],linea[9],linea[10],"\n",lineb[1],lineb[2],lineb[3],lineb[4],lineb[5],lineb[6],lineb[7],lineb[8],lineb[9],lineb[10],"\n",linec[1],linec[2],linec[3],linec[4],linec[5],linec[6],linec[7],linec[8],linec[9],linec[10],"\n",lined[1],lined[2],lined[3],lined[4],lined[5],lined[6],lined[7],lined[8],lined[9],lined[10],"\n",linee[1],linee[2],linee[3],linee[4],linee[5],linee[6],linee[7],linee[8],linee[9],linee[10],"\n",linef[1],linef[2],linef[3],linef[4],linef[5],linef[6],linef[7],linef[8],linef[9],linef[10],"\n",lineg[1],lineg[2],lineg[3],lineg[4],lineg[5],lineg[6],lineg[7],lineg[8],lineg[9],lineg[10],"\n",lineh[1],lineh[2],lineh[3],lineh[4],lineh[5],lineh[7],lineh[7],lineh[8],lineh[9],lineh[10],"\n",linei[1],linei[2],linei[3],linei[4],linei[5],linei[6],linei[7],linei[8],linei[9],linei[10],"\n",linej[1],linej[2],linej[3],linej[4],linej[5],linej[6],linej[7],linej[8],linej[9],linej[10],"\n\n\n")
end
    
    
    
    





function conwaysgameoflife (n)
  counter = 0
  while counter < n
  do
    counter = counter + 1
    compacter()
    printt()
  end
end

conwaysgameoflife(5)